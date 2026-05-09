; DESCRIPTION: Places a orange 44x54 rectangle at position (196, 34).
; PLAN: r0=196(x), r1=34(y), r2=44(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 34
LDI r2, 44
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
