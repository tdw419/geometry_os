; DESCRIPTION: Places a red 96x114 rectangle at position (293, 21).
; PLAN: r0=293(x), r1=21(y), r2=96(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 21
LDI r2, 96
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
