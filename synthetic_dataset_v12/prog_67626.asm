; DESCRIPTION: Composite: Places a black 81x85 rectangle at position (271, 135) then Draws a green line from (313, 123) to (213, 237) then Sets a single green pixel at (375, 13).
; PLAN: r0=271(x), r1=135(y), r2=81(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x1), r6=123(y1), r7=213(x2), r8=237(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=375(x), r11=13(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 135
LDI r2, 81
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 123
LDI r7, 213
LDI r8, 237
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 13
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
