; DESCRIPTION: Renders a red box of size 47x108 starting at (417, 94).
; PLAN: r0=417(x), r1=94(y), r2=47(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 94
LDI r2, 47
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
