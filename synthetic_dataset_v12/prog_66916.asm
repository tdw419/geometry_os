; DESCRIPTION: Composite: Sets a single purple pixel at (324, 81) then Draws a magenta circle centered at (202, 83) with radius 77 then Draws a purple line from (301, 32) to (104, 21).
; PLAN: r0=324(x), r1=81(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=83(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=301(x1), r11=32(y1), r12=104(x2), r13=21(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 81
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 83
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 301
LDI r11, 32
LDI r12, 104
LDI r13, 21
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
