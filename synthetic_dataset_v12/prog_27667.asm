; DESCRIPTION: Places a yellow 90x114 rectangle at position (181, 71).
; PLAN: r0=181(x), r1=71(y), r2=90(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 71
LDI r2, 90
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
