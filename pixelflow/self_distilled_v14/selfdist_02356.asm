; DESCRIPTION: Places a orange 118x99 box at position (224, 138).
; PLAN: r0=224(x), r1=138(y), r2=118(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 138
LDI r2, 118
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
