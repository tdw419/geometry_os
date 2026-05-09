; DESCRIPTION: Places a yellow 21x54 rectangle at position (76, 84).
; PLAN: r0=76(x), r1=84(y), r2=21(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 84
LDI r2, 21
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
