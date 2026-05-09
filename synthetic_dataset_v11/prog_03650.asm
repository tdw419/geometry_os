; DESCRIPTION: Creates a blue rectangular region at (33, 221) spanning 64 by 31 pixels.
; PLAN: r0=33(x), r1=221(y), r2=64(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 221
LDI r2, 64
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
