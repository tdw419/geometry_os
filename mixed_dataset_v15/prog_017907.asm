; DESCRIPTION: Composite: Draws a magenta line from (388, 221) to (401, 115) then Places a orange dot at position (51, 60).
; PLAN: r0=388(x1), r1=221(y1), r2=401(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=60(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 388
LDI r1, 221
LDI r2, 401
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 60
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
