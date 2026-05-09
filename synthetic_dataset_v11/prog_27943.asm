; DESCRIPTION: Places a orange 33x80 rectangle at position (184, 118).
; PLAN: r0=184(x), r1=118(y), r2=33(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 118
LDI r2, 33
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
