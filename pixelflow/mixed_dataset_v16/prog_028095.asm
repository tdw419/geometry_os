; DESCRIPTION: Renders a black box of size 46x79 starting at (214, 77).
; PLAN: r0=214(x), r1=77(y), r2=46(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 77
LDI r2, 46
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
