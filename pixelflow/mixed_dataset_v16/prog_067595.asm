; DESCRIPTION: Creates a red rectangular region at (404, 171) spanning 98 by 66 pixels.
; PLAN: r0=404(x), r1=171(y), r2=98(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 171
LDI r2, 98
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
