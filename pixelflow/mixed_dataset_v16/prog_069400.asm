; DESCRIPTION: Renders a red rectangular region spanning 54 by 15 at (347, 178).
; PLAN: r0=347(x), r1=178(y), r2=54(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 178
LDI r2, 54
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
