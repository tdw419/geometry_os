; DESCRIPTION: Places a orange 54x54 rectangle at position (329, 71).
; PLAN: r0=329(x), r1=71(y), r2=54(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 71
LDI r2, 54
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
