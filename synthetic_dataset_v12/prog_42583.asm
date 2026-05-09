; DESCRIPTION: Renders a white box of size 37x20 starting at (162, 152).
; PLAN: r0=162(x), r1=152(y), r2=37(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 152
LDI r2, 37
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
