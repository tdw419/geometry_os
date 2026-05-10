; DESCRIPTION: Renders a black box of size 31x112 starting at (198, 4).
; PLAN: r0=198(x), r1=4(y), r2=31(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 4
LDI r2, 31
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
