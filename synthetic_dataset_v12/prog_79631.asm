; DESCRIPTION: Places a blue 21x62 rectangle at position (189, 83).
; PLAN: r0=189(x), r1=83(y), r2=21(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 83
LDI r2, 21
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
