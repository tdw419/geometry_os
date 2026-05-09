; DESCRIPTION: Places a red 103x61 rectangle at position (179, 172).
; PLAN: r0=179(x), r1=172(y), r2=103(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 172
LDI r2, 103
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
