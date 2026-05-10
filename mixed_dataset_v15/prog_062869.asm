; DESCRIPTION: Places a orange 95x70 rectangle at position (140, 26).
; PLAN: r0=140(x), r1=26(y), r2=95(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 26
LDI r2, 95
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
