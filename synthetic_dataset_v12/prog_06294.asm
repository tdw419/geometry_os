; DESCRIPTION: Renders a green box of size 84x19 starting at (75, 20).
; PLAN: r0=75(x), r1=20(y), r2=84(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 20
LDI r2, 84
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
