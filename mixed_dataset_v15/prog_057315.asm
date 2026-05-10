; DESCRIPTION: Renders a green box of size 117x115 starting at (134, 60).
; PLAN: r0=134(x), r1=60(y), r2=117(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 60
LDI r2, 117
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
