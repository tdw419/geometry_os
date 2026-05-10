; DESCRIPTION: Creates a blue rectangular region at (46, 119) spanning 42 by 31 pixels.
; PLAN: r0=46(x), r1=119(y), r2=42(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 119
LDI r2, 42
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
