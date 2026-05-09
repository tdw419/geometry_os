; DESCRIPTION: Renders a white box of size 60x100 starting at (446, 80).
; PLAN: r0=446(x), r1=80(y), r2=60(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 80
LDI r2, 60
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
