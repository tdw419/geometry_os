; DESCRIPTION: Composite: Places a white dot at position (392, 102) then Draws a blue line from (141, 243) to (33, 178) then Creates a magenta rectangular region at (257, 112) spanning 42 by 56 pixels.
; PLAN: r0=392(x), r1=102(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=141(x1), r6=243(y1), r7=33(x2), r8=178(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=257(x), r11=112(y), r12=42(width), r13=56(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 102
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 141
LDI r6, 243
LDI r7, 33
LDI r8, 178
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 112
LDI r12, 42
LDI r13, 56
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
