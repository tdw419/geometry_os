; DESCRIPTION: Creates a yellow rectangular region at (70, 70) spanning 95 by 77 pixels.
; PLAN: r0=70(x), r1=70(y), r2=95(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 70
LDI r2, 95
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
