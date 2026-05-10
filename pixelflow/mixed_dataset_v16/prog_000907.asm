; DESCRIPTION: Creates a white rectangular region at (406, 107) spanning 85 by 95 pixels.
; PLAN: r0=406(x), r1=107(y), r2=85(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 107
LDI r2, 85
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
