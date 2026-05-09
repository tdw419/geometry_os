; DESCRIPTION: Places a red 47x12 rectangle at position (217, 157).
; PLAN: r0=217(x), r1=157(y), r2=47(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 157
LDI r2, 47
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
