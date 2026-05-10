; DESCRIPTION: Composite: Places a white line segment connecting (103, 18) to (79, 206) then Places a orange dot at position (486, 255) then Renders a purple box of size 71x92 starting at (69, 151).
; PLAN: r0=103(x1), r1=18(y1), r2=79(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=486(x), r6=255(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=69(x), r11=151(y), r12=71(width), r13=92(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 18
LDI r2, 79
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 255
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 69
LDI r11, 151
LDI r12, 71
LDI r13, 92
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
