; DESCRIPTION: Renders a yellow box of size 36x61 starting at (214, 87).
; PLAN: r0=214(x), r1=87(y), r2=36(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 87
LDI r2, 36
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
