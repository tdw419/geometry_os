; DESCRIPTION: Places a green 118x50 rectangle at position (52, 72).
; PLAN: r0=52(x), r1=72(y), r2=118(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 72
LDI r2, 118
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
