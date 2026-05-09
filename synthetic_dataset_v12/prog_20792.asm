; DESCRIPTION: Creates a blue rectangular region at (254, 221) spanning 66 by 21 pixels.
; PLAN: r0=254(x), r1=221(y), r2=66(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 221
LDI r2, 66
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
