; DESCRIPTION: Creates a blue rectangular region at (91, 116) spanning 50 by 32 pixels.
; PLAN: r0=91(x), r1=116(y), r2=50(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 116
LDI r2, 50
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
