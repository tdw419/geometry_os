; DESCRIPTION: Renders a green box of size 50x46 starting at (435, 69).
; PLAN: r0=435(x), r1=69(y), r2=50(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 69
LDI r2, 50
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
