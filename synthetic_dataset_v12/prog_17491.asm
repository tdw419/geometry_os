; DESCRIPTION: Places a orange 107x78 rectangle at position (169, 83).
; PLAN: r0=169(x), r1=83(y), r2=107(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 83
LDI r2, 107
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
