; DESCRIPTION: Creates a magenta rectangular region at (218, 164) spanning 51 by 76 pixels.
; PLAN: r0=218(x), r1=164(y), r2=51(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 164
LDI r2, 51
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
