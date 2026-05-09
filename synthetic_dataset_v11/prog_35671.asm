; DESCRIPTION: Renders a white box of size 48x75 starting at (200, 84).
; PLAN: r0=200(x), r1=84(y), r2=48(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 84
LDI r2, 48
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
