; DESCRIPTION: Renders a green box of size 30x103 starting at (181, 90).
; PLAN: r0=181(x), r1=90(y), r2=30(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 90
LDI r2, 30
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
