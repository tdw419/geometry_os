; DESCRIPTION: Creates a magenta rectangular region at (434, 109) spanning 73 by 92 pixels.
; PLAN: r0=434(x), r1=109(y), r2=73(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 109
LDI r2, 73
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
