; DESCRIPTION: Places a green 60x47 rectangle at position (79, 122).
; PLAN: r0=79(x), r1=122(y), r2=60(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 122
LDI r2, 60
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
