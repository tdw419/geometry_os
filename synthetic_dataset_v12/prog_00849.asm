; DESCRIPTION: Renders a yellow box of size 27x71 starting at (205, 132).
; PLAN: r0=205(x), r1=132(y), r2=27(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 132
LDI r2, 27
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
