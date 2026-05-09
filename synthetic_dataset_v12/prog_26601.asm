; DESCRIPTION: Creates a black rectangular region at (190, 44) spanning 10 by 70 pixels.
; PLAN: r0=190(x), r1=44(y), r2=10(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 44
LDI r2, 10
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
