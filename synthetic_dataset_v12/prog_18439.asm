; DESCRIPTION: Creates a blue rectangular region at (365, 34) spanning 50 by 107 pixels.
; PLAN: r0=365(x), r1=34(y), r2=50(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 34
LDI r2, 50
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
