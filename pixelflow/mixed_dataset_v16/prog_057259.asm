; DESCRIPTION: Creates a purple rectangular region at (218, 6) spanning 82 by 120 pixels.
; PLAN: r0=218(x), r1=6(y), r2=82(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 6
LDI r2, 82
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
