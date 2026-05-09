; DESCRIPTION: Renders a red box of size 21x44 starting at (96, 38).
; PLAN: r0=96(x), r1=38(y), r2=21(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 38
LDI r2, 21
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
