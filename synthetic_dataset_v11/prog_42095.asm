; DESCRIPTION: Creates a yellow rectangular region at (182, 120) spanning 21 by 82 pixels.
; PLAN: r0=182(x), r1=120(y), r2=21(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 120
LDI r2, 21
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
