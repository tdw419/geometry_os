; DESCRIPTION: Renders a green box of size 24x63 starting at (165, 70).
; PLAN: r0=165(x), r1=70(y), r2=24(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 70
LDI r2, 24
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
