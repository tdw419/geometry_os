; DESCRIPTION: Creates a blue rectangular region at (4, 93) spanning 92 by 46 pixels.
; PLAN: r0=4(x), r1=93(y), r2=92(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 93
LDI r2, 92
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
