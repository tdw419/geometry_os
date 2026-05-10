; DESCRIPTION: Renders a white rectangular region spanning 87 by 44 at (149, 132).
; PLAN: r0=149(x), r1=132(y), r2=87(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 132
LDI r2, 87
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
