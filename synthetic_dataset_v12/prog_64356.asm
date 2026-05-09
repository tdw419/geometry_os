; DESCRIPTION: Places a orange 60x97 rectangle at position (21, 140).
; PLAN: r0=21(x), r1=140(y), r2=60(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 140
LDI r2, 60
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
