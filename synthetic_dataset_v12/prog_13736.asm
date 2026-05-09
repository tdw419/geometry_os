; DESCRIPTION: Creates a purple rectangular region at (406, 111) spanning 55 by 82 pixels.
; PLAN: r0=406(x), r1=111(y), r2=55(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 111
LDI r2, 55
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
