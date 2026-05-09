; DESCRIPTION: Renders a black box of size 24x56 starting at (173, 51).
; PLAN: r0=173(x), r1=51(y), r2=24(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 51
LDI r2, 24
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
