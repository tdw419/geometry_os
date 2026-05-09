; DESCRIPTION: Places a orange 93x13 rectangle at position (48, 57).
; PLAN: r0=48(x), r1=57(y), r2=93(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 57
LDI r2, 93
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
