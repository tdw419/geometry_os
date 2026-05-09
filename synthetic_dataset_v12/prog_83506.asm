; DESCRIPTION: Places a yellow 118x51 rectangle at position (308, 65).
; PLAN: r0=308(x), r1=65(y), r2=118(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 65
LDI r2, 118
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
