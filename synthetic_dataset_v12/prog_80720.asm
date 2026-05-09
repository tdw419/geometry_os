; DESCRIPTION: Renders a black box of size 88x24 starting at (422, 180).
; PLAN: r0=422(x), r1=180(y), r2=88(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 180
LDI r2, 88
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
