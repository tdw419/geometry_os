; DESCRIPTION: Renders a white rectangular region spanning 48 by 80 at (337, 19).
; PLAN: r0=337(x), r1=19(y), r2=48(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 19
LDI r2, 48
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
