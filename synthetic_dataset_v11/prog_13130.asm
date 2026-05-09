; DESCRIPTION: Places a yellow 38x73 rectangle at position (69, 101).
; PLAN: r0=69(x), r1=101(y), r2=38(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 101
LDI r2, 38
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
