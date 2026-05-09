; DESCRIPTION: Places a yellow 80x78 rectangle at position (39, 99).
; PLAN: r0=39(x), r1=99(y), r2=80(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 99
LDI r2, 80
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
