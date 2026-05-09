; DESCRIPTION: Creates a white rectangular region at (186, 73) spanning 45 by 86 pixels.
; PLAN: r0=186(x), r1=73(y), r2=45(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 73
LDI r2, 45
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
