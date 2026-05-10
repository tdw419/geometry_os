; DESCRIPTION: Places a orange 96x88 rectangle at position (365, 21).
; PLAN: r0=365(x), r1=21(y), r2=96(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 21
LDI r2, 96
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
