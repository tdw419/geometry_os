; DESCRIPTION: Renders a red rectangular region spanning 76 by 47 at (369, 47).
; PLAN: r0=369(x), r1=47(y), r2=76(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 47
LDI r2, 76
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
