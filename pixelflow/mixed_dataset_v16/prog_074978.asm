; DESCRIPTION: Places a orange 54x66 box at position (271, 194).
; PLAN: r0=271(x), r1=194(y), r2=54(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 194
LDI r2, 54
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
