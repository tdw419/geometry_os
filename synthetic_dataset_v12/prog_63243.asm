; DESCRIPTION: Renders a black box of size 44x89 starting at (400, 19).
; PLAN: r0=400(x), r1=19(y), r2=44(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 19
LDI r2, 44
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
