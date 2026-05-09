; DESCRIPTION: Places a green 108x78 rectangle at position (326, 124).
; PLAN: r0=326(x), r1=124(y), r2=108(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 124
LDI r2, 108
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
