; DESCRIPTION: Composite: Renders a blue line between points (138, 143) and (299, 33) then Places a magenta dot at position (100, 99).
; PLAN: r0=138(x1), r1=143(y1), r2=299(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=99(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 143
LDI r2, 299
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 99
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
