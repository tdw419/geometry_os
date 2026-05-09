; DESCRIPTION: Creates a purple rectangular region at (246, 150) spanning 59 by 82 pixels.
; PLAN: r0=246(x), r1=150(y), r2=59(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 150
LDI r2, 59
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
