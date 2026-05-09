; DESCRIPTION: Creates a red rectangular region at (264, 36) spanning 46 by 113 pixels.
; PLAN: r0=264(x), r1=36(y), r2=46(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 36
LDI r2, 46
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
