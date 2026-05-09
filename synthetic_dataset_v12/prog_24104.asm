; DESCRIPTION: Composite: Renders a cyan line between points (52, 177) and (468, 155) then Renders a yellow box of size 99x31 starting at (84, 120).
; PLAN: r0=52(x1), r1=177(y1), r2=468(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=120(y), r7=99(width), r8=31(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 177
LDI r2, 468
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 120
LDI r7, 99
LDI r8, 31
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
