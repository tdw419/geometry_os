; DESCRIPTION: Renders a white box of size 18x13 starting at (152, 80).
; PLAN: r0=152(x), r1=80(y), r2=18(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 80
LDI r2, 18
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
