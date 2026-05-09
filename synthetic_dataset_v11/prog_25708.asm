; DESCRIPTION: Creates a blue rectangular region at (38, 33) spanning 41 by 48 pixels.
; PLAN: r0=38(x), r1=33(y), r2=41(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 33
LDI r2, 41
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
