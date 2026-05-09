; DESCRIPTION: Composite: Renders a cyan box of size 31x52 starting at (447, 116) then Sets a single white pixel at (257, 6) then Draws a yellow line from (499, 134) to (199, 247).
; PLAN: r0=447(x), r1=116(y), r2=31(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=6(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=499(x1), r11=134(y1), r12=199(x2), r13=247(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 116
LDI r2, 31
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 6
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 499
LDI r11, 134
LDI r12, 199
LDI r13, 247
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
