; DESCRIPTION: Renders a white rectangular region spanning 98 by 30 at (386, 149).
; PLAN: r0=386(x), r1=149(y), r2=98(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 149
LDI r2, 98
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
