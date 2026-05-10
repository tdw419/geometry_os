; DESCRIPTION: Places a orange 59x93 rectangle at position (138, 65).
; PLAN: r0=138(x), r1=65(y), r2=59(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 65
LDI r2, 59
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
