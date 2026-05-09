; DESCRIPTION: Places a green 107x15 rectangle at position (118, 38).
; PLAN: r0=118(x), r1=38(y), r2=107(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 38
LDI r2, 107
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
