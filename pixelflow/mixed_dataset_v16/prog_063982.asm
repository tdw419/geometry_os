; DESCRIPTION: Places a yellow 100x40 rectangle at position (345, 33).
; PLAN: r0=345(x), r1=33(y), r2=100(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 33
LDI r2, 100
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
