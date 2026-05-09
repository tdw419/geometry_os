; DESCRIPTION: Renders a white box of size 33x111 starting at (110, 82).
; PLAN: r0=110(x), r1=82(y), r2=33(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 82
LDI r2, 33
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
