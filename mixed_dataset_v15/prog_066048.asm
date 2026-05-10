; DESCRIPTION: Renders a red box of size 60x13 starting at (255, 34).
; PLAN: r0=255(x), r1=34(y), r2=60(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 34
LDI r2, 60
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
