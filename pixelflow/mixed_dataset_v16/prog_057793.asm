; DESCRIPTION: Composite: Places a purple line segment connecting (143, 174) to (70, 82) then Places a orange dot at position (32, 27).
; PLAN: r0=143(x1), r1=174(y1), r2=70(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=27(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 143
LDI r1, 174
LDI r2, 70
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 27
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
