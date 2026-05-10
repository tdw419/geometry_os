; DESCRIPTION: Creates a magenta rectangular region at (7, 112) spanning 64 by 28 pixels.
; PLAN: r0=7(x), r1=112(y), r2=64(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 112
LDI r2, 64
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
