; DESCRIPTION: Places a green 93x78 rectangle at position (128, 134).
; PLAN: r0=128(x), r1=134(y), r2=93(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 134
LDI r2, 93
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
