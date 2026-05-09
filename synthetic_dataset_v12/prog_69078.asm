; DESCRIPTION: Composite: Renders a white box of size 71x74 starting at (405, 91) then Draws a orange line from (484, 214) to (501, 39) then Places a magenta dot at position (112, 152).
; PLAN: r0=405(x), r1=91(y), r2=71(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x1), r6=214(y1), r7=501(x2), r8=39(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=112(x), r11=152(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 91
LDI r2, 71
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 214
LDI r7, 501
LDI r8, 39
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 152
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
