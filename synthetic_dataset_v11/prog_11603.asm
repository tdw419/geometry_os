; DESCRIPTION: Places a yellow 111x41 rectangle at position (114, 136).
; PLAN: r0=114(x), r1=136(y), r2=111(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 136
LDI r2, 111
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
