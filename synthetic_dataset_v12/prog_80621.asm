; DESCRIPTION: Places a orange 88x41 rectangle at position (237, 65).
; PLAN: r0=237(x), r1=65(y), r2=88(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 65
LDI r2, 88
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
