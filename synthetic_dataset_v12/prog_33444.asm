; DESCRIPTION: Composite: Renders a green box of size 63x32 starting at (5, 51) then Places a blue line segment connecting (63, 206) to (252, 30) then Places a green dot at position (145, 65).
; PLAN: r0=5(x), r1=51(y), r2=63(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x1), r6=206(y1), r7=252(x2), r8=30(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=65(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 5
LDI r1, 51
LDI r2, 63
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 206
LDI r7, 252
LDI r8, 30
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 65
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
