; DESCRIPTION: Places a cyan 73x118 rectangle at position (145, 119).
; PLAN: r0=145(x), r1=119(y), r2=73(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 119
LDI r2, 73
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
