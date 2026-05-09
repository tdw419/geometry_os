; DESCRIPTION: Renders a black box of size 96x97 starting at (121, 150).
; PLAN: r0=121(x), r1=150(y), r2=96(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 150
LDI r2, 96
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
