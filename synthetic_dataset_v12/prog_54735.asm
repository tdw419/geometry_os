; DESCRIPTION: Creates a blue rectangular region at (51, 30) spanning 82 by 120 pixels.
; PLAN: r0=51(x), r1=30(y), r2=82(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 30
LDI r2, 82
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
