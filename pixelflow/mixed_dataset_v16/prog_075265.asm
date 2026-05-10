; DESCRIPTION: Renders a green box of size 118x28 starting at (3, 150).
; PLAN: r0=3(x), r1=150(y), r2=118(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 150
LDI r2, 118
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
