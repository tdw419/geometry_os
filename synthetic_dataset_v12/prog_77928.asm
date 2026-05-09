; DESCRIPTION: Places a red 100x61 rectangle at position (217, 83).
; PLAN: r0=217(x), r1=83(y), r2=100(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 83
LDI r2, 100
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
