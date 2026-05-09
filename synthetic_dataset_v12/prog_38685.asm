; DESCRIPTION: Places a orange 73x27 rectangle at position (256, 100).
; PLAN: r0=256(x), r1=100(y), r2=73(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 100
LDI r2, 73
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
