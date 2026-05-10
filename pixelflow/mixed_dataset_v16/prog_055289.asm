; DESCRIPTION: Places a orange 48x97 rectangle at position (236, 10).
; PLAN: r0=236(x), r1=10(y), r2=48(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 10
LDI r2, 48
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
