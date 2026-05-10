; DESCRIPTION: Places a yellow 119x80 box at position (245, 153).
; PLAN: r0=245(x), r1=153(y), r2=119(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 153
LDI r2, 119
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
