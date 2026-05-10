; DESCRIPTION: Creates a blue rectangular region at (380, 186) spanning 87 by 51 pixels.
; PLAN: r0=380(x), r1=186(y), r2=87(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 186
LDI r2, 87
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
