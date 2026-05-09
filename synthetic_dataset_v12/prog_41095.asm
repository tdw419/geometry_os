; DESCRIPTION: Creates a purple rectangular region at (346, 55) spanning 12 by 120 pixels.
; PLAN: r0=346(x), r1=55(y), r2=12(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 55
LDI r2, 12
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
