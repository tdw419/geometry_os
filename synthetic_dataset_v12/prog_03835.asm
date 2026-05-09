; DESCRIPTION: Creates a purple rectangular region at (400, 94) spanning 61 by 109 pixels.
; PLAN: r0=400(x), r1=94(y), r2=61(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 94
LDI r2, 61
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
