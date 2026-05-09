; DESCRIPTION: Places a orange 48x93 rectangle at position (138, 127).
; PLAN: r0=138(x), r1=127(y), r2=48(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 127
LDI r2, 48
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
