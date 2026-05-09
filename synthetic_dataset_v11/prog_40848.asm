; DESCRIPTION: Creates a magenta rectangular region at (138, 214) spanning 11 by 17 pixels.
; PLAN: r0=138(x), r1=214(y), r2=11(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 214
LDI r2, 11
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
