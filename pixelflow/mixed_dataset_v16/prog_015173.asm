; DESCRIPTION: Renders a yellow box of size 85x70 starting at (307, 115).
; PLAN: r0=307(x), r1=115(y), r2=85(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 115
LDI r2, 85
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
