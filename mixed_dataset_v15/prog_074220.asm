; DESCRIPTION: Renders a black box of size 47x25 starting at (256, 3).
; PLAN: r0=256(x), r1=3(y), r2=47(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 3
LDI r2, 47
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
