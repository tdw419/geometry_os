; DESCRIPTION: Places a yellow 33x37 rectangle at position (301, 136).
; PLAN: r0=301(x), r1=136(y), r2=33(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 136
LDI r2, 33
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
