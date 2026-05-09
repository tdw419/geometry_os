; DESCRIPTION: Composite: . Then Sets a single white pixel at (49, 244). Then Places a white 101x23 rectangle at position (138, 198).
; PLAN: r0=49(x), r1=244(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=138(x), r1=198(y), r2=101(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (49, 244).
; PLAN: r0=49(x), r1=244(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 244
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a white 101x23 rectangle at position (138, 198).
; PLAN: r0=138(x), r1=198(y), r2=101(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 198
LDI r2, 101
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
