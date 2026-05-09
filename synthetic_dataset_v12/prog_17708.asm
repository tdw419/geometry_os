; DESCRIPTION: Places a yellow 66x84 rectangle at position (108, 28).
; PLAN: r0=108(x), r1=28(y), r2=66(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 28
LDI r2, 66
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
