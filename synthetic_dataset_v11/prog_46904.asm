; DESCRIPTION: Composite: . Then Renders a black box of size 110x85 starting at (59, 97). Then Places a red dot at position (193, 181).
; PLAN: r0=59(x), r1=97(y), r2=110(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=193(x), r1=181(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black box of size 110x85 starting at (59, 97).
; PLAN: r0=59(x), r1=97(y), r2=110(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 97
LDI r2, 110
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (193, 181).
; PLAN: r0=193(x), r1=181(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 181
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
