; DESCRIPTION: Renders a white box of size 75x33 starting at (38, 178).
; PLAN: r0=38(x), r1=178(y), r2=75(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 178
LDI r2, 75
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
