; DESCRIPTION: Renders a green box of size 57x117 starting at (282, 61).
; PLAN: r0=282(x), r1=61(y), r2=57(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 61
LDI r2, 57
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
