; DESCRIPTION: Places a red 86x95 rectangle at position (118, 52).
; PLAN: r0=118(x), r1=52(y), r2=86(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 52
LDI r2, 86
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
