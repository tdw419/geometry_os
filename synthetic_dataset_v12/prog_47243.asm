; DESCRIPTION: Creates a red rectangular region at (245, 145) spanning 98 by 55 pixels.
; PLAN: r0=245(x), r1=145(y), r2=98(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 145
LDI r2, 98
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
