; DESCRIPTION: Places a white 71x81 rectangle at position (96, 175).
; PLAN: r0=96(x), r1=175(y), r2=71(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 175
LDI r2, 71
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
