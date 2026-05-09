; DESCRIPTION: Places a orange 10x66 rectangle at position (21, 148).
; PLAN: r0=21(x), r1=148(y), r2=10(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 148
LDI r2, 10
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
