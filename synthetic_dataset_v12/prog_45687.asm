; DESCRIPTION: Places a green 57x24 rectangle at position (172, 106).
; PLAN: r0=172(x), r1=106(y), r2=57(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 106
LDI r2, 57
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
