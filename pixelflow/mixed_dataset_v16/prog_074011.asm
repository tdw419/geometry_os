; DESCRIPTION: Renders a red box of size 64x18 starting at (422, 202).
; PLAN: r0=422(x), r1=202(y), r2=64(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 202
LDI r2, 64
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
