; DESCRIPTION: Places a yellow 95x114 rectangle at position (28, 39).
; PLAN: r0=28(x), r1=39(y), r2=95(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 39
LDI r2, 95
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
