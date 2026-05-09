; DESCRIPTION: Places a orange 31x23 rectangle at position (188, 167).
; PLAN: r0=188(x), r1=167(y), r2=31(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 167
LDI r2, 31
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
