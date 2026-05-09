; DESCRIPTION: Composite: . Then Places a white dot at position (117, 139). Then Places a white 39x89 rectangle at position (3, 3).
; PLAN: r0=117(x), r1=139(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=3(x), r1=3(y), r2=39(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (117, 139).
; PLAN: r0=117(x), r1=139(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 139
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a white 39x89 rectangle at position (3, 3).
; PLAN: r0=3(x), r1=3(y), r2=39(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 3
LDI r2, 39
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
