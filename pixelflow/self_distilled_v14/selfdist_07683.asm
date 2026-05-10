; DESCRIPTION: Renders a yellow rectangular region spanning 95 by 73 at (365, 200).
; PLAN: r0=365(x), r1=200(y), r2=95(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 200
LDI r2, 95
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
