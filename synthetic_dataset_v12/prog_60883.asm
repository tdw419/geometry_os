; DESCRIPTION: Creates a blue rectangular region at (437, 58) spanning 74 by 68 pixels.
; PLAN: r0=437(x), r1=58(y), r2=74(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 58
LDI r2, 74
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
