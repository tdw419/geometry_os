; DESCRIPTION: Places a orange 84x103 rectangle at position (120, 136).
; PLAN: r0=120(x), r1=136(y), r2=84(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 136
LDI r2, 84
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
