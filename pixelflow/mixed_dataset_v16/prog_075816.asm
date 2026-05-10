; DESCRIPTION: Places a yellow 74x66 rectangle at position (182, 26).
; PLAN: r0=182(x), r1=26(y), r2=74(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 26
LDI r2, 74
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
