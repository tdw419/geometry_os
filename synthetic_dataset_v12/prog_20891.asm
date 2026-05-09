; DESCRIPTION: Composite: Sets a single red pixel at (288, 228) then Places a cyan line segment connecting (20, 209) to (486, 134) then Draws a magenta circle centered at (332, 108) with radius 66.
; PLAN: r0=288(x), r1=228(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=20(x1), r6=209(y1), r7=486(x2), r8=134(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=332(x), r11=108(y), r12=66(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 288
LDI r1, 228
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 20
LDI r6, 209
LDI r7, 486
LDI r8, 134
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 108
LDI r12, 66
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
