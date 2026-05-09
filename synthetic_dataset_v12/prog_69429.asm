; DESCRIPTION: Places a orange 13x40 rectangle at position (355, 22).
; PLAN: r0=355(x), r1=22(y), r2=13(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 22
LDI r2, 13
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
