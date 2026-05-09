; DESCRIPTION: Places a orange 27x93 rectangle at position (261, 142).
; PLAN: r0=261(x), r1=142(y), r2=27(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 142
LDI r2, 27
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
