; DESCRIPTION: Renders a yellow box of size 33x96 starting at (143, 108).
; PLAN: r0=143(x), r1=108(y), r2=33(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 108
LDI r2, 33
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
