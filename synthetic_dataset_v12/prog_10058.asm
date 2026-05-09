; DESCRIPTION: Creates a white rectangular region at (404, 34) spanning 71 by 117 pixels.
; PLAN: r0=404(x), r1=34(y), r2=71(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 34
LDI r2, 71
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
