; DESCRIPTION: Composite: Sets a single magenta pixel at (388, 227) then Places a cyan line segment connecting (388, 23) to (448, 65) then Renders a orange box of size 79x11 starting at (321, 184).
; PLAN: r0=388(x), r1=227(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=388(x1), r6=23(y1), r7=448(x2), r8=65(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=184(y), r12=79(width), r13=11(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 227
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 23
LDI r7, 448
LDI r8, 65
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 184
LDI r12, 79
LDI r13, 11
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
