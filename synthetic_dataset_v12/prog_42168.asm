; DESCRIPTION: Renders a green box of size 14x94 starting at (15, 103).
; PLAN: r0=15(x), r1=103(y), r2=14(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 103
LDI r2, 14
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
