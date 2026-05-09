; DESCRIPTION: Places a yellow 39x97 rectangle at position (33, 100).
; PLAN: r0=33(x), r1=100(y), r2=39(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 100
LDI r2, 39
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
