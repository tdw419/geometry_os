; DESCRIPTION: Creates a red rectangular region at (404, 139) spanning 82 by 71 pixels.
; PLAN: r0=404(x), r1=139(y), r2=82(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 139
LDI r2, 82
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
