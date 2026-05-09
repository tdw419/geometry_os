; DESCRIPTION: Places a green 86x24 rectangle at position (164, 75).
; PLAN: r0=164(x), r1=75(y), r2=86(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 75
LDI r2, 86
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
