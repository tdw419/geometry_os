; DESCRIPTION: Renders a yellow box of size 27x100 starting at (187, 112).
; PLAN: r0=187(x), r1=112(y), r2=27(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 112
LDI r2, 27
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
