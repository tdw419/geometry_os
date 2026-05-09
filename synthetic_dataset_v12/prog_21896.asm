; DESCRIPTION: Composite: Renders a blue line between points (17, 90) and (79, 178) then Renders a yellow box of size 93x64 starting at (172, 50).
; PLAN: r0=17(x1), r1=90(y1), r2=79(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=50(y), r7=93(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 90
LDI r2, 79
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 50
LDI r7, 93
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
