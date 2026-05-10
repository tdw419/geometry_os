; DESCRIPTION: Composite: Places a magenta circle of radius 55 at center (181, 164) then Draws a purple line from (352, 201) to (460, 209) then Places a black dot at position (283, 229).
; PLAN: r0=181(x), r1=164(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x1), r6=201(y1), r7=460(x2), r8=209(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=283(x), r11=229(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 181
LDI r1, 164
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 201
LDI r7, 460
LDI r8, 209
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 229
LDI r12, 0x000000
PSET r10, r11, r12
HALT
