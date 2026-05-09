; DESCRIPTION: Renders a green box of size 70x50 starting at (62, 0).
; PLAN: r0=62(x), r1=0(y), r2=70(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 0
LDI r2, 70
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
