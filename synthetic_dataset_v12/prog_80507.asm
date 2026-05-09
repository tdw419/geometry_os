; DESCRIPTION: Creates a red rectangular region at (378, 3) spanning 50 by 116 pixels.
; PLAN: r0=378(x), r1=3(y), r2=50(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 3
LDI r2, 50
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
