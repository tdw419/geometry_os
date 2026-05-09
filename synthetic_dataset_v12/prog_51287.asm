; DESCRIPTION: Places a yellow 84x30 rectangle at position (336, 118).
; PLAN: r0=336(x), r1=118(y), r2=84(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 118
LDI r2, 84
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
