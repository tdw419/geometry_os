; DESCRIPTION: Places a red 116x107 rectangle at position (10, 120).
; PLAN: r0=10(x), r1=120(y), r2=116(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 120
LDI r2, 116
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
