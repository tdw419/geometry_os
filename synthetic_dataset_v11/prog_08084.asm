; DESCRIPTION: Places a yellow 14x79 rectangle at position (107, 167).
; PLAN: r0=107(x), r1=167(y), r2=14(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 167
LDI r2, 14
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
