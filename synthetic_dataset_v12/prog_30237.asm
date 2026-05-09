; DESCRIPTION: Creates a purple rectangular region at (404, 57) spanning 90 by 36 pixels.
; PLAN: r0=404(x), r1=57(y), r2=90(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 57
LDI r2, 90
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
