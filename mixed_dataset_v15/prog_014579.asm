; DESCRIPTION: Composite: Sets a single yellow pixel at (31, 50) then Draws a blue line from (235, 48) to (456, 19) then Renders a black box of size 99x93 starting at (196, 57).
; PLAN: r0=31(x), r1=50(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=235(x1), r6=48(y1), r7=456(x2), r8=19(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=57(y), r12=99(width), r13=93(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 50
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 235
LDI r6, 48
LDI r7, 456
LDI r8, 19
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 57
LDI r12, 99
LDI r13, 93
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
