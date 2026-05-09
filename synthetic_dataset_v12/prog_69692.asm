; DESCRIPTION: Renders a black box of size 27x31 starting at (204, 59).
; PLAN: r0=204(x), r1=59(y), r2=27(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 59
LDI r2, 27
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
