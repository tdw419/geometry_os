; DESCRIPTION: Places a green 35x12 rectangle at position (0, 72).
; PLAN: r0=0(x), r1=72(y), r2=35(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 72
LDI r2, 35
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
