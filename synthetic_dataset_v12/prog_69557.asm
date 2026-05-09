; DESCRIPTION: Places a yellow 48x108 rectangle at position (119, 58).
; PLAN: r0=119(x), r1=58(y), r2=48(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 58
LDI r2, 48
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
