; DESCRIPTION: Renders a black box of size 16x79 starting at (418, 18).
; PLAN: r0=418(x), r1=18(y), r2=16(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 18
LDI r2, 16
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
