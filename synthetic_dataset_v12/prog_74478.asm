; DESCRIPTION: Renders a red box of size 38x63 starting at (65, 180).
; PLAN: r0=65(x), r1=180(y), r2=38(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 180
LDI r2, 38
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
