; DESCRIPTION: Places a orange 66x72 rectangle at position (226, 175).
; PLAN: r0=226(x), r1=175(y), r2=66(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 175
LDI r2, 66
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
