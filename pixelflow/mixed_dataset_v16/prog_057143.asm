; DESCRIPTION: Places a orange 105x112 rectangle at position (272, 80).
; PLAN: r0=272(x), r1=80(y), r2=105(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 80
LDI r2, 105
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
