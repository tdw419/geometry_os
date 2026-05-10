; DESCRIPTION: Places a yellow 49x61 rectangle at position (69, 188).
; PLAN: r0=69(x), r1=188(y), r2=49(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 188
LDI r2, 49
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
