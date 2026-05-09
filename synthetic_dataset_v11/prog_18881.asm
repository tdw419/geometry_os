; DESCRIPTION: Renders a black box of size 120x100 starting at (123, 124).
; PLAN: r0=123(x), r1=124(y), r2=120(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 124
LDI r2, 120
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
