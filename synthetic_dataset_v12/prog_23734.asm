; DESCRIPTION: Creates a yellow rectangular region at (287, 68) spanning 92 by 113 pixels.
; PLAN: r0=287(x), r1=68(y), r2=92(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 68
LDI r2, 92
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
