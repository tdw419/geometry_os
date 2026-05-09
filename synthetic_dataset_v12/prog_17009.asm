; DESCRIPTION: Creates a white rectangular region at (225, 159) spanning 21 by 48 pixels.
; PLAN: r0=225(x), r1=159(y), r2=21(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 159
LDI r2, 21
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
