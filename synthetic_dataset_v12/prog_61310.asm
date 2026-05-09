; DESCRIPTION: Places a black 52x81 rectangle at position (372, 175).
; PLAN: r0=372(x), r1=175(y), r2=52(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 175
LDI r2, 52
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
