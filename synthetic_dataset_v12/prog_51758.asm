; DESCRIPTION: Composite: Draws a black rectangle at (210, 27) with width 92 and height 33 then Places a green dot at position (120, 81) then Draws a black line from (124, 97) to (213, 218).
; PLAN: r0=210(x), r1=27(y), r2=92(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=81(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=124(x1), r11=97(y1), r12=213(x2), r13=218(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 27
LDI r2, 92
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 81
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 124
LDI r11, 97
LDI r12, 213
LDI r13, 218
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
