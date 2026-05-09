; DESCRIPTION: Renders a green box of size 110x63 starting at (24, 171).
; PLAN: r0=24(x), r1=171(y), r2=110(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 171
LDI r2, 110
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
