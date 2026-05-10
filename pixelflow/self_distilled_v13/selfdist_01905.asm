; DESCRIPTION: Renders a red rectangular region spanning 37 by 111 at (60, 44).
; PLAN: r0=60(x), r1=44(y), r2=37(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 44
LDI r2, 37
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
