; DESCRIPTION: Places a white 93x74 rectangle at position (378, 131).
; PLAN: r0=378(x), r1=131(y), r2=93(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 131
LDI r2, 93
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
