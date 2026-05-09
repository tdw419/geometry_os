; DESCRIPTION: Creates a white rectangular region at (166, 221) spanning 40 by 31 pixels.
; PLAN: r0=166(x), r1=221(y), r2=40(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 221
LDI r2, 40
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
