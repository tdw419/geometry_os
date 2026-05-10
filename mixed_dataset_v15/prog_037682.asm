; DESCRIPTION: Renders a red rectangular region spanning 93 by 59 at (253, 46).
; PLAN: r0=253(x), r1=46(y), r2=93(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 46
LDI r2, 93
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
