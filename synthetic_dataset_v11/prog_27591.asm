; DESCRIPTION: Places a green 78x52 rectangle at position (107, 79).
; PLAN: r0=107(x), r1=79(y), r2=78(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 79
LDI r2, 78
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
