; DESCRIPTION: Composite: Places a blue 63x91 rectangle at position (247, 10) then Sets a single magenta pixel at (399, 132) then Renders a magenta disk with center (197, 178) and radius 64.
; PLAN: r0=247(x), r1=10(y), r2=63(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x), r6=132(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=197(x), r11=178(y), r12=64(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 10
LDI r2, 63
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 132
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 197
LDI r11, 178
LDI r12, 64
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
