; DESCRIPTION: Renders a red box of size 33x19 starting at (363, 214).
; PLAN: r0=363(x), r1=214(y), r2=33(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 214
LDI r2, 33
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
