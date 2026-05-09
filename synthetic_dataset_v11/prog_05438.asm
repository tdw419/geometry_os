; DESCRIPTION: Places a yellow 49x116 rectangle at position (135, 89).
; PLAN: r0=135(x), r1=89(y), r2=49(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 89
LDI r2, 49
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
