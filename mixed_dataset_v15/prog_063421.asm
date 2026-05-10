; DESCRIPTION: Composite: Draws a blue line from (69, 22) to (126, 140) then Places a green 80x90 rectangle at position (173, 0) then Sets a single magenta pixel at (423, 243).
; PLAN: r0=69(x1), r1=22(y1), r2=126(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=0(y), r7=80(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=423(x), r11=243(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 22
LDI r2, 126
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 0
LDI r7, 80
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 243
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
