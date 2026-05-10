; DESCRIPTION: Composite: Places a red dot at position (455, 126) then Renders a orange disk with center (200, 180) and radius 41 then Places a magenta line segment connecting (492, 159) to (130, 0).
; PLAN: r0=455(x), r1=126(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=180(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=492(x1), r11=159(y1), r12=130(x2), r13=0(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 126
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 200
LDI r6, 180
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 492
LDI r11, 159
LDI r12, 130
LDI r13, 0
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
