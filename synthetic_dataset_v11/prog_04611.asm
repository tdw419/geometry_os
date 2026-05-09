; DESCRIPTION: Places a orange 80x91 rectangle at position (62, 98).
; PLAN: r0=62(x), r1=98(y), r2=80(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 98
LDI r2, 80
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
