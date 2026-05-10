; DESCRIPTION: Renders a blue rectangular region spanning 73 by 115 at (295, 60).
; PLAN: r0=295(x), r1=60(y), r2=73(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 60
LDI r2, 73
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
