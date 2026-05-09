; DESCRIPTION: Renders a green box of size 30x88 starting at (179, 143).
; PLAN: r0=179(x), r1=143(y), r2=30(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 143
LDI r2, 30
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
