; DESCRIPTION: Places a orange 102x78 rectangle at position (345, 50).
; PLAN: r0=345(x), r1=50(y), r2=102(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 50
LDI r2, 102
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
