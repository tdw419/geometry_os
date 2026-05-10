; DESCRIPTION: Composite: Places a cyan dot at position (415, 16) then Draws a blue line from (305, 45) to (349, 11) then Draws a orange rectangle at (132, 122) with width 67 and height 97.
; PLAN: r0=415(x), r1=16(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=305(x1), r6=45(y1), r7=349(x2), r8=11(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=122(y), r12=67(width), r13=97(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 16
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 45
LDI r7, 349
LDI r8, 11
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 122
LDI r12, 67
LDI r13, 97
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
