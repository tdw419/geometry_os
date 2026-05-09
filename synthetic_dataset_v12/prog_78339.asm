; DESCRIPTION: Renders a red box of size 35x97 starting at (180, 35).
; PLAN: r0=180(x), r1=35(y), r2=35(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 35
LDI r2, 35
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
