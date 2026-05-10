; DESCRIPTION: Places a red 100x16 rectangle at position (68, 63).
; PLAN: r0=68(x), r1=63(y), r2=100(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 63
LDI r2, 100
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
