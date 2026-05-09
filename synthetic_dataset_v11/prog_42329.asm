; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (120, 52) spanning 41 by 27 pixels. Then Places a black dot at position (12, 233).
; PLAN: r0=120(x), r1=52(y), r2=41(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=12(x), r1=233(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (120, 52) spanning 41 by 27 pixels.
; PLAN: r0=120(x), r1=52(y), r2=41(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 52
LDI r2, 41
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (12, 233).
; PLAN: r0=12(x), r1=233(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 233
LDI r2, 0x000000
PSET r0, r1, r2
HALT
