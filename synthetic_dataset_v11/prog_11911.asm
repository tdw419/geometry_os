; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (180, 70) with radius 50. Then Places a orange dot at position (70, 217).
; PLAN: r0=180(x), r1=70(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=70(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (180, 70) with radius 50.
; PLAN: r0=180(x), r1=70(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 70
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (70, 217).
; PLAN: r0=70(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 217
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
