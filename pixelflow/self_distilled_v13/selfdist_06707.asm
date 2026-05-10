; DESCRIPTION: Renders a red rectangular region spanning 36 by 57 at (290, 115).
; PLAN: r0=290(x), r1=115(y), r2=36(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 115
LDI r2, 36
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
