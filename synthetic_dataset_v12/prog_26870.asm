; DESCRIPTION: Renders a red box of size 83x83 starting at (349, 150).
; PLAN: r0=349(x), r1=150(y), r2=83(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 150
LDI r2, 83
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
