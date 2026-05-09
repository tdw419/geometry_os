; DESCRIPTION: Creates a blue rectangular region at (146, 109) spanning 55 by 94 pixels.
; PLAN: r0=146(x), r1=109(y), r2=55(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 109
LDI r2, 55
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
