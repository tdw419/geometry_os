; DESCRIPTION: Renders a red box of size 40x78 starting at (422, 15).
; PLAN: r0=422(x), r1=15(y), r2=40(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 15
LDI r2, 40
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
