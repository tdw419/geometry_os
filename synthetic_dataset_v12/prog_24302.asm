; DESCRIPTION: Places a white 11x33 rectangle at position (274, 93).
; PLAN: r0=274(x), r1=93(y), r2=11(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 93
LDI r2, 11
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
