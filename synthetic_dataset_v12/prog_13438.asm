; DESCRIPTION: Creates a yellow rectangular region at (308, 171) spanning 37 by 45 pixels.
; PLAN: r0=308(x), r1=171(y), r2=37(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 171
LDI r2, 37
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
