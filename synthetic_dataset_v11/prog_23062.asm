; DESCRIPTION: Places a green 114x53 rectangle at position (111, 172).
; PLAN: r0=111(x), r1=172(y), r2=114(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 172
LDI r2, 114
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
