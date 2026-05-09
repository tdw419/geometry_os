; DESCRIPTION: Renders a black box of size 115x16 starting at (214, 44).
; PLAN: r0=214(x), r1=44(y), r2=115(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 44
LDI r2, 115
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
