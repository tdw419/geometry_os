; DESCRIPTION: Places a orange 34x35 rectangle at position (36, 106).
; PLAN: r0=36(x), r1=106(y), r2=34(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 106
LDI r2, 34
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
