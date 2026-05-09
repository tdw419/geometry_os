; DESCRIPTION: Places a white 81x39 rectangle at position (93, 186).
; PLAN: r0=93(x), r1=186(y), r2=81(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 186
LDI r2, 81
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
