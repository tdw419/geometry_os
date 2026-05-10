; DESCRIPTION: Creates a magenta rectangular region at (48, 100) spanning 27 by 32 pixels.
; PLAN: r0=48(x), r1=100(y), r2=27(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 100
LDI r2, 27
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
