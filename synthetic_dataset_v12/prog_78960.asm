; DESCRIPTION: Renders a black box of size 19x55 starting at (180, 96).
; PLAN: r0=180(x), r1=96(y), r2=19(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 96
LDI r2, 19
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
