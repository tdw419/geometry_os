; DESCRIPTION: Places a orange 23x58 rectangle at position (187, 80).
; PLAN: r0=187(x), r1=80(y), r2=23(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 80
LDI r2, 23
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
