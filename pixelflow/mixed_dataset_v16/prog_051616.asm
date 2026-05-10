; DESCRIPTION: Places a yellow 116x106 rectangle at position (38, 132).
; PLAN: r0=38(x), r1=132(y), r2=116(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 132
LDI r2, 116
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
