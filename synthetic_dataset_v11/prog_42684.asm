; DESCRIPTION: Composite: . Then Places a orange 37x22 rectangle at position (114, 34). Then Sets a single white pixel at (24, 145).
; PLAN: r0=114(x), r1=34(y), r2=37(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=24(x), r1=145(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange 37x22 rectangle at position (114, 34).
; PLAN: r0=114(x), r1=34(y), r2=37(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 34
LDI r2, 37
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (24, 145).
; PLAN: r0=24(x), r1=145(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 145
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
