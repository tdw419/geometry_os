; DESCRIPTION: Creates a blue rectangular region at (44, 98) spanning 117 by 82 pixels.
; PLAN: r0=44(x), r1=98(y), r2=117(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 98
LDI r2, 117
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
