; DESCRIPTION: Places a orange 70x78 rectangle at position (170, 169).
; PLAN: r0=170(x), r1=169(y), r2=70(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 169
LDI r2, 70
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
