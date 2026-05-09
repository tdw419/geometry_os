; DESCRIPTION: Places a orange 97x110 rectangle at position (112, 91).
; PLAN: r0=112(x), r1=91(y), r2=97(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 91
LDI r2, 97
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
