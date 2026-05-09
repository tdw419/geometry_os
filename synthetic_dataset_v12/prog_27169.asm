; DESCRIPTION: Creates a blue rectangular region at (329, 4) spanning 103 by 51 pixels.
; PLAN: r0=329(x), r1=4(y), r2=103(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 4
LDI r2, 103
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
