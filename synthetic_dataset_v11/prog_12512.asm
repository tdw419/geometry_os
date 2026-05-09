; DESCRIPTION: Places a yellow 38x114 rectangle at position (171, 66).
; PLAN: r0=171(x), r1=66(y), r2=38(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 66
LDI r2, 38
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
