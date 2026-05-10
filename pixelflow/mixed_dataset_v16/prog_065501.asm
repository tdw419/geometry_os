; DESCRIPTION: Places a green 13x108 rectangle at position (245, 128).
; PLAN: r0=245(x), r1=128(y), r2=13(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 128
LDI r2, 13
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
