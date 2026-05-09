; DESCRIPTION: Renders a red box of size 94x83 starting at (93, 79).
; PLAN: r0=93(x), r1=79(y), r2=94(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 79
LDI r2, 94
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
