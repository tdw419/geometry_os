; DESCRIPTION: Places a yellow 91x62 rectangle at position (84, 193).
; PLAN: r0=84(x), r1=193(y), r2=91(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 193
LDI r2, 91
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
