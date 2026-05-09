; DESCRIPTION: Places a orange 72x63 rectangle at position (158, 56).
; PLAN: r0=158(x), r1=56(y), r2=72(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 56
LDI r2, 72
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
