; DESCRIPTION: Renders a green box of size 112x113 starting at (208, 24).
; PLAN: r0=208(x), r1=24(y), r2=112(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 24
LDI r2, 112
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
