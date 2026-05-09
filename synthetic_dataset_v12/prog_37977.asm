; DESCRIPTION: Renders a green box of size 43x45 starting at (440, 90).
; PLAN: r0=440(x), r1=90(y), r2=43(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 90
LDI r2, 43
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
