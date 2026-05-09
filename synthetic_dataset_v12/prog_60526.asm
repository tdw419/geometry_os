; DESCRIPTION: Places a orange 117x63 rectangle at position (40, 57).
; PLAN: r0=40(x), r1=57(y), r2=117(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 57
LDI r2, 117
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
