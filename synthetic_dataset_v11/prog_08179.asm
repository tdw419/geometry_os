; DESCRIPTION: Places a orange 61x22 rectangle at position (71, 205).
; PLAN: r0=71(x), r1=205(y), r2=61(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 205
LDI r2, 61
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
