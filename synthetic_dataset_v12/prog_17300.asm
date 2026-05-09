; DESCRIPTION: Renders a red box of size 75x70 starting at (195, 59).
; PLAN: r0=195(x), r1=59(y), r2=75(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 59
LDI r2, 75
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
