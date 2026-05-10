; DESCRIPTION: Creates a magenta rectangular region at (422, 59) spanning 88 by 120 pixels.
; PLAN: r0=422(x), r1=59(y), r2=88(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 59
LDI r2, 88
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
