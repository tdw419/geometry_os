; DESCRIPTION: Renders a white rectangular region spanning 97 by 60 at (58, 174).
; PLAN: r0=58(x), r1=174(y), r2=97(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 174
LDI r2, 97
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
