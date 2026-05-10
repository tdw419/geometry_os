; DESCRIPTION: Renders a white rectangular region spanning 111 by 65 at (115, 48).
; PLAN: r0=115(x), r1=48(y), r2=111(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 48
LDI r2, 111
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
