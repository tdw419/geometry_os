; DESCRIPTION: Renders a yellow box of size 113x77 starting at (1, 8).
; PLAN: r0=1(x), r1=8(y), r2=113(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 8
LDI r2, 113
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
