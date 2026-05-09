; DESCRIPTION: Places a orange 90x31 rectangle at position (306, 152).
; PLAN: r0=306(x), r1=152(y), r2=90(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 152
LDI r2, 90
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
