; DESCRIPTION: Renders a white box of size 61x111 starting at (55, 65).
; PLAN: r0=55(x), r1=65(y), r2=61(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 65
LDI r2, 61
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
