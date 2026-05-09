; DESCRIPTION: Places a white 81x83 rectangle at position (71, 60).
; PLAN: r0=71(x), r1=60(y), r2=81(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 60
LDI r2, 81
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
