; DESCRIPTION: Creates a red rectangular region at (404, 157) spanning 44 by 65 pixels.
; PLAN: r0=404(x), r1=157(y), r2=44(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 157
LDI r2, 44
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
