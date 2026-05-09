; DESCRIPTION: Places a white 100x81 rectangle at position (146, 93).
; PLAN: r0=146(x), r1=93(y), r2=100(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 93
LDI r2, 100
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
