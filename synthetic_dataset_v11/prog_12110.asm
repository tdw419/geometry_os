; DESCRIPTION: Places a yellow 74x112 rectangle at position (176, 118).
; PLAN: r0=176(x), r1=118(y), r2=74(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 118
LDI r2, 74
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
