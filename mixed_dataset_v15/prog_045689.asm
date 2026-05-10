; DESCRIPTION: Renders a green rectangular region spanning 12 by 53 at (386, 49).
; PLAN: r0=386(x), r1=49(y), r2=12(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 49
LDI r2, 12
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
