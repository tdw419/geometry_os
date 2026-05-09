; DESCRIPTION: Renders a green box of size 48x82 starting at (296, 110).
; PLAN: r0=296(x), r1=110(y), r2=48(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 110
LDI r2, 48
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
