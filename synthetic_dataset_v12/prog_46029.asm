; DESCRIPTION: Places a orange 27x32 rectangle at position (311, 189).
; PLAN: r0=311(x), r1=189(y), r2=27(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 189
LDI r2, 27
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
