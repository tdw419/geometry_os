; DESCRIPTION: Creates a purple rectangular region at (57, 206) spanning 53 by 46 pixels.
; PLAN: r0=57(x), r1=206(y), r2=53(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 206
LDI r2, 53
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
