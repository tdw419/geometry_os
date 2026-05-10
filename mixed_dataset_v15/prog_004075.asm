; DESCRIPTION: Creates a white rectangular region at (246, 143) spanning 71 by 109 pixels.
; PLAN: r0=246(x), r1=143(y), r2=71(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 143
LDI r2, 71
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
