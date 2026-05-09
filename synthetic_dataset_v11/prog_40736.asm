; DESCRIPTION: Creates a red rectangular region at (90, 234) spanning 44 by 10 pixels.
; PLAN: r0=90(x), r1=234(y), r2=44(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 234
LDI r2, 44
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
