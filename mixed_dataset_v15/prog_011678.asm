; DESCRIPTION: Composite: Places a purple 73x22 rectangle at position (412, 13) then Places a green dot at position (106, 209) then Creates a white circular shape at (352, 59) with radius 54.
; PLAN: r0=412(x), r1=13(y), r2=73(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=209(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=352(x), r11=59(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 412
LDI r1, 13
LDI r2, 73
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 209
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 352
LDI r11, 59
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
