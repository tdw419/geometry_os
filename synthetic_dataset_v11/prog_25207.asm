; DESCRIPTION: Composite: . Then Places a orange dot at position (56, 248). Then Places a red 45x39 rectangle at position (4, 124).
; PLAN: r0=56(x), r1=248(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=4(x), r1=124(y), r2=45(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (56, 248).
; PLAN: r0=56(x), r1=248(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 248
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a red 45x39 rectangle at position (4, 124).
; PLAN: r0=4(x), r1=124(y), r2=45(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 124
LDI r2, 45
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
