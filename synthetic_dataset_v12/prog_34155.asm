; DESCRIPTION: Places a green 84x106 rectangle at position (238, 86).
; PLAN: r0=238(x), r1=86(y), r2=84(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 86
LDI r2, 84
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
