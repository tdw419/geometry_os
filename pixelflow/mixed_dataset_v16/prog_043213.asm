; DESCRIPTION: Renders a white box of size 76x46 starting at (292, 80).
; PLAN: r0=292(x), r1=80(y), r2=76(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 80
LDI r2, 76
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
