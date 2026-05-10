; DESCRIPTION: Places a orange 44x101 rectangle at position (453, 150).
; PLAN: r0=453(x), r1=150(y), r2=44(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 150
LDI r2, 44
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
