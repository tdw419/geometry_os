; DESCRIPTION: Places a orange 58x94 rectangle at position (1, 29).
; PLAN: r0=1(x), r1=29(y), r2=58(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 29
LDI r2, 58
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
