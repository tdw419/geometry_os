; DESCRIPTION: Places a orange 87x10 rectangle at position (112, 83).
; PLAN: r0=112(x), r1=83(y), r2=87(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 83
LDI r2, 87
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
