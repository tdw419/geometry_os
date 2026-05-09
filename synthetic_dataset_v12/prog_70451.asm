; DESCRIPTION: Creates a purple rectangular region at (380, 197) spanning 38 by 58 pixels.
; PLAN: r0=380(x), r1=197(y), r2=38(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 197
LDI r2, 38
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
