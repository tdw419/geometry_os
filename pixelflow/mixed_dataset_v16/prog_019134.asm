; DESCRIPTION: Places a green 108x80 rectangle at position (245, 83).
; PLAN: r0=245(x), r1=83(y), r2=108(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 83
LDI r2, 108
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
