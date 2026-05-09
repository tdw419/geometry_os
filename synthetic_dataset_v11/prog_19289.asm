; DESCRIPTION: Places a white 99x93 rectangle at position (134, 123).
; PLAN: r0=134(x), r1=123(y), r2=99(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 123
LDI r2, 99
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
