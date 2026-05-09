; DESCRIPTION: Creates a red rectangular region at (371, 46) spanning 90 by 25 pixels.
; PLAN: r0=371(x), r1=46(y), r2=90(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 46
LDI r2, 90
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
