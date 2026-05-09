; DESCRIPTION: Places a yellow 114x36 rectangle at position (57, 95).
; PLAN: r0=57(x), r1=95(y), r2=114(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 95
LDI r2, 114
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
