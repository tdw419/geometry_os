; DESCRIPTION: Renders a red box of size 38x19 starting at (422, 141).
; PLAN: r0=422(x), r1=141(y), r2=38(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 141
LDI r2, 38
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
