; DESCRIPTION: Composite: Places a yellow line segment connecting (238, 119) to (464, 107) then Renders a cyan box of size 25x20 starting at (487, 107).
; PLAN: r0=238(x1), r1=119(y1), r2=464(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=107(y), r7=25(width), r8=20(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 119
LDI r2, 464
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 107
LDI r7, 25
LDI r8, 20
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
