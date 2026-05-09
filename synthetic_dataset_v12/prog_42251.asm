; DESCRIPTION: Places a orange 88x63 rectangle at position (236, 135).
; PLAN: r0=236(x), r1=135(y), r2=88(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 135
LDI r2, 88
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
