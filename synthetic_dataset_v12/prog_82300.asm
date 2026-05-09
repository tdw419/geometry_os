; DESCRIPTION: Creates a red rectangular region at (387, 32) spanning 78 by 112 pixels.
; PLAN: r0=387(x), r1=32(y), r2=78(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 32
LDI r2, 78
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
