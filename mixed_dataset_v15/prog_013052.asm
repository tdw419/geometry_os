; DESCRIPTION: Places a green 74x65 rectangle at position (435, 100).
; PLAN: r0=435(x), r1=100(y), r2=74(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 100
LDI r2, 74
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
