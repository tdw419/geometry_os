; DESCRIPTION: Renders a yellow rectangular region spanning 95 by 103 at (177, 177).
; PLAN: r0=177(x), r1=177(y), r2=95(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 177
LDI r2, 95
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
