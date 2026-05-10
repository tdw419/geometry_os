; DESCRIPTION: Composite: Places a cyan dot at position (409, 78) then Draws a blue line from (184, 74) to (356, 243) then Creates a purple rectangular region at (11, 19) spanning 107 by 13 pixels.
; PLAN: r0=409(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=184(x1), r6=74(y1), r7=356(x2), r8=243(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=11(x), r11=19(y), r12=107(width), r13=13(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 78
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 184
LDI r6, 74
LDI r7, 356
LDI r8, 243
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 19
LDI r12, 107
LDI r13, 13
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
