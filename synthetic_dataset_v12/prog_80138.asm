; DESCRIPTION: Renders a yellow box of size 66x57 starting at (173, 138).
; PLAN: r0=173(x), r1=138(y), r2=66(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 138
LDI r2, 66
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
