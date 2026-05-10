; DESCRIPTION: Renders a white rectangular region spanning 87 by 26 at (229, 26).
; PLAN: r0=229(x), r1=26(y), r2=87(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 26
LDI r2, 87
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
