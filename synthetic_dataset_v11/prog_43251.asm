; DESCRIPTION: Places a yellow 114x96 rectangle at position (107, 95).
; PLAN: r0=107(x), r1=95(y), r2=114(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 95
LDI r2, 114
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
