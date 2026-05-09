; DESCRIPTION: Renders a yellow box of size 101x77 starting at (190, 107).
; PLAN: r0=190(x), r1=107(y), r2=101(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 107
LDI r2, 101
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
