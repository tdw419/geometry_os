; DESCRIPTION: Places a orange 40x29 rectangle at position (56, 224).
; PLAN: r0=56(x), r1=224(y), r2=40(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 224
LDI r2, 40
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
