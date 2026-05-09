; DESCRIPTION: Places a yellow 73x103 rectangle at position (79, 151).
; PLAN: r0=79(x), r1=151(y), r2=73(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 151
LDI r2, 73
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
