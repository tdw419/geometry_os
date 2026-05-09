; DESCRIPTION: Creates a orange rectangular region at (280, 239) spanning 112 by 15 pixels.
; PLAN: r0=280(x), r1=239(y), r2=112(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 239
LDI r2, 112
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
