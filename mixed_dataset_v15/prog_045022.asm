; DESCRIPTION: Creates a yellow rectangular region at (146, 116) spanning 90 by 19 pixels.
; PLAN: r0=146(x), r1=116(y), r2=90(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 116
LDI r2, 90
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
