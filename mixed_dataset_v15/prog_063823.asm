; DESCRIPTION: Renders a white rectangular region spanning 48 by 115 at (245, 54).
; PLAN: r0=245(x), r1=54(y), r2=48(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 54
LDI r2, 48
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
