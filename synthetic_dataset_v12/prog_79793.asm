; DESCRIPTION: Places a white 116x35 rectangle at position (179, 13).
; PLAN: r0=179(x), r1=13(y), r2=116(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 13
LDI r2, 116
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
