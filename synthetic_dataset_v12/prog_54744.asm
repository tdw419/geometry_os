; DESCRIPTION: Renders a white box of size 23x111 starting at (368, 142).
; PLAN: r0=368(x), r1=142(y), r2=23(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 142
LDI r2, 23
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
