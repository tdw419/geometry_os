; DESCRIPTION: Places a orange 98x78 rectangle at position (401, 123).
; PLAN: r0=401(x), r1=123(y), r2=98(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 123
LDI r2, 98
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
