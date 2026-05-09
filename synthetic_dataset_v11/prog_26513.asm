; DESCRIPTION: Places a green 21x75 rectangle at position (215, 122).
; PLAN: r0=215(x), r1=122(y), r2=21(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 122
LDI r2, 21
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
