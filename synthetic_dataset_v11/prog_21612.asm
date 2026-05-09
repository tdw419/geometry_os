; DESCRIPTION: Renders a black box of size 56x77 starting at (127, 133).
; PLAN: r0=127(x), r1=133(y), r2=56(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 133
LDI r2, 56
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
