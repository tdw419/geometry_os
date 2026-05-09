; DESCRIPTION: Places a green 118x92 rectangle at position (74, 157).
; PLAN: r0=74(x), r1=157(y), r2=118(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 157
LDI r2, 118
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
