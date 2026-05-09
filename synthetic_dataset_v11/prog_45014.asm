; DESCRIPTION: Composite: . Then Places a red dot at position (172, 223). Then Places a orange circle of radius 19 at center (100, 83).
; PLAN: r0=172(x), r1=223(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=100(x), r1=83(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (172, 223).
; PLAN: r0=172(x), r1=223(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 223
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 19 at center (100, 83).
; PLAN: r0=100(x), r1=83(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 83
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
