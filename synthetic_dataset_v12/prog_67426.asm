; DESCRIPTION: Renders a white box of size 80x70 starting at (120, 169).
; PLAN: r0=120(x), r1=169(y), r2=80(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 169
LDI r2, 80
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
