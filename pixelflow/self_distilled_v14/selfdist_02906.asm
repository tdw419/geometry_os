; DESCRIPTION: Renders a red rectangular region spanning 44 by 101 at (255, 133).
; PLAN: r0=255(x), r1=133(y), r2=44(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 133
LDI r2, 44
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
