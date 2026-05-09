; DESCRIPTION: Creates a white rectangular region at (368, 60) spanning 60 by 98 pixels.
; PLAN: r0=368(x), r1=60(y), r2=60(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 60
LDI r2, 60
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
