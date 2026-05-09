; DESCRIPTION: Places a orange 115x34 rectangle at position (355, 44).
; PLAN: r0=355(x), r1=44(y), r2=115(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 44
LDI r2, 115
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
