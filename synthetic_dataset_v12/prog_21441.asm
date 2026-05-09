; DESCRIPTION: Creates a white rectangular region at (488, 140) spanning 14 by 74 pixels.
; PLAN: r0=488(x), r1=140(y), r2=14(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 140
LDI r2, 14
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
