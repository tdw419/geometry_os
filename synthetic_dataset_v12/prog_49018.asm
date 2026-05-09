; DESCRIPTION: Renders a white box of size 14x10 starting at (331, 65).
; PLAN: r0=331(x), r1=65(y), r2=14(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 65
LDI r2, 14
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
