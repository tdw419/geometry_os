; DESCRIPTION: Composite: . Then Places a purple dot at position (233, 82). Then Renders a black box of size 56x27 starting at (80, 110).
; PLAN: r0=233(x), r1=82(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=80(x), r1=110(y), r2=56(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (233, 82).
; PLAN: r0=233(x), r1=82(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 82
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 56x27 starting at (80, 110).
; PLAN: r0=80(x), r1=110(y), r2=56(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 110
LDI r2, 56
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
