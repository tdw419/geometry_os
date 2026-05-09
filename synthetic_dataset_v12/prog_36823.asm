; DESCRIPTION: Composite: Renders a yellow line between points (295, 127) and (212, 3) then Renders a blue box of size 119x87 starting at (103, 60).
; PLAN: r0=295(x1), r1=127(y1), r2=212(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=60(y), r7=119(width), r8=87(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 127
LDI r2, 212
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 60
LDI r7, 119
LDI r8, 87
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
