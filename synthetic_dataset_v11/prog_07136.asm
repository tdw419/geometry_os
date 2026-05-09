; DESCRIPTION: Places a cyan 74x94 rectangle at position (155, 153).
; PLAN: r0=155(x), r1=153(y), r2=74(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 153
LDI r2, 74
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
