; DESCRIPTION: Composite: Places a blue dot at position (323, 240) then Draws a magenta circle centered at (356, 32) with radius 12 then Draws a magenta line from (126, 201) to (5, 249).
; PLAN: r0=323(x), r1=240(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=32(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=126(x1), r11=201(y1), r12=5(x2), r13=249(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 240
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 356
LDI r6, 32
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 126
LDI r11, 201
LDI r12, 5
LDI r13, 249
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
