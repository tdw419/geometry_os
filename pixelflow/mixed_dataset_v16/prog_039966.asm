; DESCRIPTION: Creates a orange rectangular region at (168, 112) spanning 17 by 17 pixels.
; PLAN: r0=168(x), r1=112(y), r2=17(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 112
LDI r2, 17
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
