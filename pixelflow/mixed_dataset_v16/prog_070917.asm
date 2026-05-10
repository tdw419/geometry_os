; DESCRIPTION: Renders a red box of size 83x33 starting at (417, 61).
; PLAN: r0=417(x), r1=61(y), r2=83(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 61
LDI r2, 83
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
