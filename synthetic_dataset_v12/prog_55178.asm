; DESCRIPTION: Places a green 19x74 rectangle at position (61, 162).
; PLAN: r0=61(x), r1=162(y), r2=19(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 162
LDI r2, 19
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
