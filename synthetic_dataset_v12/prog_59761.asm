; DESCRIPTION: Renders a black box of size 36x45 starting at (424, 92).
; PLAN: r0=424(x), r1=92(y), r2=36(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 92
LDI r2, 36
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
