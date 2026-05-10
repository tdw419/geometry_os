; DESCRIPTION: Composite: Places a black line segment connecting (485, 134) to (138, 68) then Places a black dot at position (501, 115).
; PLAN: r0=485(x1), r1=134(y1), r2=138(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=501(x), r6=115(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 485
LDI r1, 134
LDI r2, 138
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 115
LDI r7, 0x000000
PSET r5, r6, r7
HALT
