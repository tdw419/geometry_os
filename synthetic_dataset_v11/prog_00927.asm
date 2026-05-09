; DESCRIPTION: Renders a black box of size 102x81 starting at (98, 174).
; PLAN: r0=98(x), r1=174(y), r2=102(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 174
LDI r2, 102
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
