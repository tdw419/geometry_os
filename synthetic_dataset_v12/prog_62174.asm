; DESCRIPTION: Renders a red box of size 87x45 starting at (301, 31).
; PLAN: r0=301(x), r1=31(y), r2=87(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 31
LDI r2, 87
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
