; DESCRIPTION: Places a orange 63x91 rectangle at position (258, 142).
; PLAN: r0=258(x), r1=142(y), r2=63(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 142
LDI r2, 63
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
