; DESCRIPTION: Creates a purple rectangular region at (298, 36) spanning 67 by 111 pixels.
; PLAN: r0=298(x), r1=36(y), r2=67(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 36
LDI r2, 67
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
