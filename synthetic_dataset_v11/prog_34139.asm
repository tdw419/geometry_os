; DESCRIPTION: Places a green 115x38 rectangle at position (136, 51).
; PLAN: r0=136(x), r1=51(y), r2=115(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 51
LDI r2, 115
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
