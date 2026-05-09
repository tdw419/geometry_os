; DESCRIPTION: Creates a red rectangular region at (124, 82) spanning 80 by 116 pixels.
; PLAN: r0=124(x), r1=82(y), r2=80(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 82
LDI r2, 80
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
