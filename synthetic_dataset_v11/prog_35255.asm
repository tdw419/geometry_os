; DESCRIPTION: Places a orange 48x103 rectangle at position (93, 73).
; PLAN: r0=93(x), r1=73(y), r2=48(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 73
LDI r2, 48
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
