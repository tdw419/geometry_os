; DESCRIPTION: Composite: Draws a cyan line from (487, 63) to (324, 100) then Places a yellow 22x106 rectangle at position (407, 45) then Places a purple dot at position (132, 67).
; PLAN: r0=487(x1), r1=63(y1), r2=324(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=45(y), r7=22(width), r8=106(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x), r11=67(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 487
LDI r1, 63
LDI r2, 324
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 45
LDI r7, 22
LDI r8, 106
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 67
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
