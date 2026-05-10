; DESCRIPTION: Places a yellow 108x84 rectangle at position (271, 40).
; PLAN: r0=271(x), r1=40(y), r2=108(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 40
LDI r2, 108
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
