; DESCRIPTION: Composite: . Then Creates a orange circular shape at (72, 153) with radius 70. Then Places a purple dot at position (27, 4).
; PLAN: r0=72(x), r1=153(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=27(x), r1=4(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange circular shape at (72, 153) with radius 70.
; PLAN: r0=72(x), r1=153(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 153
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (27, 4).
; PLAN: r0=27(x), r1=4(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 4
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
