; DESCRIPTION: Creates a white rectangular region at (301, 177) spanning 76 by 39 pixels.
; PLAN: r0=301(x), r1=177(y), r2=76(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 177
LDI r2, 76
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
