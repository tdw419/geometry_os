; DESCRIPTION: Composite: Places a magenta dot at position (170, 194) then Places a orange circle of radius 79 at center (206, 132).
; PLAN: r0=170(x), r1=194(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=132(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 170
LDI r1, 194
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 132
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
