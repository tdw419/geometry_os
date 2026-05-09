; DESCRIPTION: Renders a red box of size 60x70 starting at (370, 10).
; PLAN: r0=370(x), r1=10(y), r2=60(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 10
LDI r2, 60
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
