; DESCRIPTION: Places a orange 103x93 rectangle at position (297, 75).
; PLAN: r0=297(x), r1=75(y), r2=103(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 75
LDI r2, 103
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
