; DESCRIPTION: Composite: Places a cyan dot at position (500, 48) then Draws a magenta circle centered at (369, 226) with radius 18 then Places a black line segment connecting (265, 213) to (210, 126).
; PLAN: r0=500(x), r1=48(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=369(x), r6=226(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x1), r11=213(y1), r12=210(x2), r13=126(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 48
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 369
LDI r6, 226
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 213
LDI r12, 210
LDI r13, 126
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
