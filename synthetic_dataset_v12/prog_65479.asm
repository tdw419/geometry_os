; DESCRIPTION: Creates a white rectangular region at (210, 178) spanning 119 by 45 pixels.
; PLAN: r0=210(x), r1=178(y), r2=119(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 178
LDI r2, 119
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
