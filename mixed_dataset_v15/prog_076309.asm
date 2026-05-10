; DESCRIPTION: Creates a blue rectangular region at (441, 242) spanning 25 by 11 pixels.
; PLAN: r0=441(x), r1=242(y), r2=25(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 242
LDI r2, 25
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
