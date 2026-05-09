; DESCRIPTION: Places a orange 56x63 rectangle at position (235, 153).
; PLAN: r0=235(x), r1=153(y), r2=56(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 153
LDI r2, 56
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
