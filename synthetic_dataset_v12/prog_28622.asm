; DESCRIPTION: Creates a blue rectangular region at (368, 75) spanning 102 by 117 pixels.
; PLAN: r0=368(x), r1=75(y), r2=102(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 75
LDI r2, 102
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
