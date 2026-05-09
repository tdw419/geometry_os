; DESCRIPTION: Renders a green box of size 65x66 starting at (173, 155).
; PLAN: r0=173(x), r1=155(y), r2=65(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 155
LDI r2, 65
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
