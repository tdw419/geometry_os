; DESCRIPTION: Places a yellow 73x106 rectangle at position (240, 87).
; PLAN: r0=240(x), r1=87(y), r2=73(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 87
LDI r2, 73
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
