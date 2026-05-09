; DESCRIPTION: Composite: Places a orange line segment connecting (291, 29) to (16, 233) then Places a purple dot at position (424, 174).
; PLAN: r0=291(x1), r1=29(y1), r2=16(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=174(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 291
LDI r1, 29
LDI r2, 16
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 174
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
