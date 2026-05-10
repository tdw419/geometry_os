; DESCRIPTION: Renders a yellow rectangular region spanning 44 by 47 at (148, 187).
; PLAN: r0=148(x), r1=187(y), r2=44(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 187
LDI r2, 44
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
