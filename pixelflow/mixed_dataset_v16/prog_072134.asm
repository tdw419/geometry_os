; DESCRIPTION: Renders a yellow rectangular region spanning 80 by 80 at (365, 40).
; PLAN: r0=365(x), r1=40(y), r2=80(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 40
LDI r2, 80
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
