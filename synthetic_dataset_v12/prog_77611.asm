; DESCRIPTION: Creates a red rectangular region at (218, 185) spanning 77 by 14 pixels.
; PLAN: r0=218(x), r1=185(y), r2=77(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 185
LDI r2, 77
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
