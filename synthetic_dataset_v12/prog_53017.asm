; DESCRIPTION: Renders a white box of size 117x18 starting at (335, 70).
; PLAN: r0=335(x), r1=70(y), r2=117(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 70
LDI r2, 117
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
