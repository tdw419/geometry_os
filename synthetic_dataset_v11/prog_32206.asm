; DESCRIPTION: Places a orange 76x99 rectangle at position (160, 112).
; PLAN: r0=160(x), r1=112(y), r2=76(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 112
LDI r2, 76
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
