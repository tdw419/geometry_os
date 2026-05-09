; DESCRIPTION: Composite: . Then Places a yellow 33x12 rectangle at position (128, 59). Then Sets a single white pixel at (10, 96).
; PLAN: r0=128(x), r1=59(y), r2=33(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=10(x), r1=96(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 33x12 rectangle at position (128, 59).
; PLAN: r0=128(x), r1=59(y), r2=33(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 59
LDI r2, 33
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (10, 96).
; PLAN: r0=10(x), r1=96(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 96
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
