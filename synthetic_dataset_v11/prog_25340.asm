; DESCRIPTION: Composite: . Then Places a red dot at position (200, 68). Then Places a orange circle of radius 46 at center (150, 161).
; PLAN: r0=200(x), r1=68(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=150(x), r1=161(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (200, 68).
; PLAN: r0=200(x), r1=68(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 68
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 46 at center (150, 161).
; PLAN: r0=150(x), r1=161(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 161
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
