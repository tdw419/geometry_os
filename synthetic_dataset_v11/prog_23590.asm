; DESCRIPTION: Composite: . Then Places a white 70x38 rectangle at position (125, 8). Then Sets a single white pixel at (112, 139).
; PLAN: r0=125(x), r1=8(y), r2=70(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=112(x), r1=139(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 70x38 rectangle at position (125, 8).
; PLAN: r0=125(x), r1=8(y), r2=70(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 8
LDI r2, 70
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (112, 139).
; PLAN: r0=112(x), r1=139(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 139
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
