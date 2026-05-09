; DESCRIPTION: Renders a black box of size 36x40 starting at (449, 164).
; PLAN: r0=449(x), r1=164(y), r2=36(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 164
LDI r2, 36
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
