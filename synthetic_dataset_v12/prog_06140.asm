; DESCRIPTION: Creates a blue rectangular region at (228, 2) spanning 116 by 12 pixels.
; PLAN: r0=228(x), r1=2(y), r2=116(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 2
LDI r2, 116
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
