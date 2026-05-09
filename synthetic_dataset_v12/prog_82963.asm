; DESCRIPTION: Composite: Renders a magenta line between points (493, 193) and (115, 110) then Renders a cyan box of size 105x83 starting at (162, 106).
; PLAN: r0=493(x1), r1=193(y1), r2=115(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=106(y), r7=105(width), r8=83(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 493
LDI r1, 193
LDI r2, 115
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 106
LDI r7, 105
LDI r8, 83
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
