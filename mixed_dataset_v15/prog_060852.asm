; DESCRIPTION: Composite: Sets a single black pixel at (367, 69) then Draws a red line from (403, 125) to (172, 129) then Places a magenta circle of radius 45 at center (112, 193).
; PLAN: r0=367(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=403(x1), r6=125(y1), r7=172(x2), r8=129(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=112(x), r11=193(y), r12=45(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 367
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 403
LDI r6, 125
LDI r7, 172
LDI r8, 129
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 193
LDI r12, 45
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
