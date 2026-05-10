; DESCRIPTION: Creates a red rectangular region at (404, 85) spanning 45 by 112 pixels.
; PLAN: r0=404(x), r1=85(y), r2=45(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 85
LDI r2, 45
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
