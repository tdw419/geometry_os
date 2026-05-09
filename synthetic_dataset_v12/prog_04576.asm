; DESCRIPTION: Renders a red box of size 86x79 starting at (395, 66).
; PLAN: r0=395(x), r1=66(y), r2=86(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 66
LDI r2, 86
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
