; DESCRIPTION: Composite: Sets a single orange pixel at (510, 205) then Draws a orange circle centered at (481, 93) with radius 19 then Places a magenta line segment connecting (367, 166) to (361, 217).
; PLAN: r0=510(x), r1=205(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=481(x), r6=93(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x1), r11=166(y1), r12=361(x2), r13=217(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 510
LDI r1, 205
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 481
LDI r6, 93
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 166
LDI r12, 361
LDI r13, 217
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
