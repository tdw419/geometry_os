; DESCRIPTION: Renders a green box of size 90x49 starting at (349, 161).
; PLAN: r0=349(x), r1=161(y), r2=90(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 161
LDI r2, 90
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
