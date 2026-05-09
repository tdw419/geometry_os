; DESCRIPTION: Places a yellow 114x43 rectangle at position (86, 43).
; PLAN: r0=86(x), r1=43(y), r2=114(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 43
LDI r2, 114
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
