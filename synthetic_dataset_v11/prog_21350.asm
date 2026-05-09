; DESCRIPTION: Places a blue 99x91 rectangle at position (68, 98).
; PLAN: r0=68(x), r1=98(y), r2=99(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 98
LDI r2, 99
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
