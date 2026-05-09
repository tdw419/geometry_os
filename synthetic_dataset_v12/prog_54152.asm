; DESCRIPTION: Creates a red rectangular region at (287, 182) spanning 59 by 39 pixels.
; PLAN: r0=287(x), r1=182(y), r2=59(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 182
LDI r2, 59
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
