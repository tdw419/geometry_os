; DESCRIPTION: Composite: Renders a yellow box of size 81x117 starting at (197, 107) then Places a cyan line segment connecting (144, 82) to (66, 36).
; PLAN: r0=197(x), r1=107(y), r2=81(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x1), r6=82(y1), r7=66(x2), r8=36(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 107
LDI r2, 81
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 82
LDI r7, 66
LDI r8, 36
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
