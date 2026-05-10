; DESCRIPTION: Places a yellow 108x70 rectangle at position (23, 32).
; PLAN: r0=23(x), r1=32(y), r2=108(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 32
LDI r2, 108
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
