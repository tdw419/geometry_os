; DESCRIPTION: Places a green 86x79 rectangle at position (292, 78).
; PLAN: r0=292(x), r1=78(y), r2=86(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 78
LDI r2, 86
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
