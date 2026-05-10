; DESCRIPTION: Composite: Draws a blue line from (400, 78) to (498, 209) then Places a magenta dot at position (202, 139) then Places a white 22x48 rectangle at position (209, 119).
; PLAN: r0=400(x1), r1=78(y1), r2=498(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=139(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=119(y), r12=22(width), r13=48(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 78
LDI r2, 498
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 139
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 209
LDI r11, 119
LDI r12, 22
LDI r13, 48
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
