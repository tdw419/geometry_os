; DESCRIPTION: Places a orange 79x90 rectangle at position (6, 22).
; PLAN: r0=6(x), r1=22(y), r2=79(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 22
LDI r2, 79
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
