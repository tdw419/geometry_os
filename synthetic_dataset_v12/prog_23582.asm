; DESCRIPTION: Creates a blue rectangular region at (362, 92) spanning 118 by 103 pixels.
; PLAN: r0=362(x), r1=92(y), r2=118(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 92
LDI r2, 118
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
