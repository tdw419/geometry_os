; DESCRIPTION: Creates a yellow rectangular region at (182, 3) spanning 16 by 111 pixels.
; PLAN: r0=182(x), r1=3(y), r2=16(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 3
LDI r2, 16
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
