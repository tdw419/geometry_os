; DESCRIPTION: Creates a red rectangular region at (289, 33) spanning 112 by 65 pixels.
; PLAN: r0=289(x), r1=33(y), r2=112(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 33
LDI r2, 112
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
