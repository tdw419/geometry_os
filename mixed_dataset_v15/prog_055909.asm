; DESCRIPTION: Places a green 71x78 rectangle at position (165, 79).
; PLAN: r0=165(x), r1=79(y), r2=71(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 79
LDI r2, 71
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
