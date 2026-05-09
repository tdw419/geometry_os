; DESCRIPTION: Places a green 105x44 rectangle at position (244, 44).
; PLAN: r0=244(x), r1=44(y), r2=105(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 44
LDI r2, 105
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
