; DESCRIPTION: Places a orange 70x40 rectangle at position (71, 22).
; PLAN: r0=71(x), r1=22(y), r2=70(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 22
LDI r2, 70
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
