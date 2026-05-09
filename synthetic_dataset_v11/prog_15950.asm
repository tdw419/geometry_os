; DESCRIPTION: Places a orange 112x40 rectangle at position (105, 159).
; PLAN: r0=105(x), r1=159(y), r2=112(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 159
LDI r2, 112
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
