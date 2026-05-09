; DESCRIPTION: Places a yellow 29x32 rectangle at position (121, 194).
; PLAN: r0=121(x), r1=194(y), r2=29(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 194
LDI r2, 29
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
