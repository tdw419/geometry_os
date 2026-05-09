; DESCRIPTION: Renders a yellow box of size 27x46 starting at (7, 209).
; PLAN: r0=7(x), r1=209(y), r2=27(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 209
LDI r2, 27
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
