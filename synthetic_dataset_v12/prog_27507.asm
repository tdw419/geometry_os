; DESCRIPTION: Renders a red box of size 24x63 starting at (311, 80).
; PLAN: r0=311(x), r1=80(y), r2=24(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 80
LDI r2, 24
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
