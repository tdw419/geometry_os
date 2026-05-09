; DESCRIPTION: Places a orange 54x58 rectangle at position (18, 46).
; PLAN: r0=18(x), r1=46(y), r2=54(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 46
LDI r2, 54
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
