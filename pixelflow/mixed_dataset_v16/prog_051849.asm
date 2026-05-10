; DESCRIPTION: Places a green 26x41 rectangle at position (307, 153).
; PLAN: r0=307(x), r1=153(y), r2=26(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 153
LDI r2, 26
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
