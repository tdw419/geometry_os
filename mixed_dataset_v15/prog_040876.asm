; DESCRIPTION: Composite: Renders a orange line between points (190, 148) and (360, 236) then Places a green dot at position (442, 43).
; PLAN: r0=190(x1), r1=148(y1), r2=360(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=43(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 190
LDI r1, 148
LDI r2, 360
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 43
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
