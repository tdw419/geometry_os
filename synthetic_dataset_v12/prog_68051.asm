; DESCRIPTION: Composite: Draws a orange line from (210, 79) to (443, 194) then Places a purple dot at position (137, 182).
; PLAN: r0=210(x1), r1=79(y1), r2=443(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=182(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 79
LDI r2, 443
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 182
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
