; DESCRIPTION: Places a red 103x93 rectangle at position (60, 22).
; PLAN: r0=60(x), r1=22(y), r2=103(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 22
LDI r2, 103
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
