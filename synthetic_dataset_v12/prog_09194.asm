; DESCRIPTION: Creates a blue rectangular region at (354, 146) spanning 54 by 76 pixels.
; PLAN: r0=354(x), r1=146(y), r2=54(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 146
LDI r2, 54
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
