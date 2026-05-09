; DESCRIPTION: Places a white 52x119 rectangle at position (226, 136).
; PLAN: r0=226(x), r1=136(y), r2=52(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 136
LDI r2, 52
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
