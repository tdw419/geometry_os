; DESCRIPTION: Places a red 81x22 rectangle at position (346, 93).
; PLAN: r0=346(x), r1=93(y), r2=81(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 93
LDI r2, 81
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
