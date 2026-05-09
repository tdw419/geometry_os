; DESCRIPTION: Renders a white box of size 37x43 starting at (387, 8).
; PLAN: r0=387(x), r1=8(y), r2=37(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 8
LDI r2, 37
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
