; DESCRIPTION: Composite: Sets a single blue pixel at (30, 192) then Places a black 112x42 rectangle at position (223, 63) then Renders a purple line between points (25, 131) and (32, 210).
; PLAN: r0=30(x), r1=192(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=63(y), r7=112(width), r8=42(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=25(x1), r11=131(y1), r12=32(x2), r13=210(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 192
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 63
LDI r7, 112
LDI r8, 42
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 131
LDI r12, 32
LDI r13, 210
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
