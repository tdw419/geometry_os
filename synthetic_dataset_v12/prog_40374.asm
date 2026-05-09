; DESCRIPTION: Composite: Places a magenta dot at position (32, 206) then Places a white circle of radius 30 at center (240, 217) then Draws a blue line from (474, 109) to (116, 57).
; PLAN: r0=32(x), r1=206(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=240(x), r6=217(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x1), r11=109(y1), r12=116(x2), r13=57(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 206
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 240
LDI r6, 217
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 109
LDI r12, 116
LDI r13, 57
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
