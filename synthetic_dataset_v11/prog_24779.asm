; DESCRIPTION: Places a orange 18x54 rectangle at position (98, 45).
; PLAN: r0=98(x), r1=45(y), r2=18(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 45
LDI r2, 18
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
