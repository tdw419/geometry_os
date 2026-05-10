; DESCRIPTION: Places a orange 72x88 box at position (130, 76).
; PLAN: r0=130(x), r1=76(y), r2=72(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 76
LDI r2, 72
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
