; DESCRIPTION: Composite: Renders a white line between points (41, 35) and (401, 69) then Places a green dot at position (348, 51).
; PLAN: r0=41(x1), r1=35(y1), r2=401(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=51(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 35
LDI r2, 401
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 51
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
