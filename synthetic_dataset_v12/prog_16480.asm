; DESCRIPTION: Renders a green box of size 59x75 starting at (205, 62).
; PLAN: r0=205(x), r1=62(y), r2=59(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 62
LDI r2, 59
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
