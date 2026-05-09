; DESCRIPTION: Renders a white box of size 108x68 starting at (80, 4).
; PLAN: r0=80(x), r1=4(y), r2=108(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 4
LDI r2, 108
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
