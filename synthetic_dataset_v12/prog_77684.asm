; DESCRIPTION: Composite: Places a purple 99x63 rectangle at position (229, 152) then Draws a white circle centered at (107, 52) with radius 51.
; PLAN: r0=229(x), r1=152(y), r2=99(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=52(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 229
LDI r1, 152
LDI r2, 99
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 52
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
