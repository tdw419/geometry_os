; DESCRIPTION: Renders a white box of size 104x43 starting at (108, 57).
; PLAN: r0=108(x), r1=57(y), r2=104(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 57
LDI r2, 104
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
