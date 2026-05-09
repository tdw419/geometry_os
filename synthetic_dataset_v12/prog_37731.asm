; DESCRIPTION: Creates a magenta rectangular region at (20, 152) spanning 93 by 71 pixels.
; PLAN: r0=20(x), r1=152(y), r2=93(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 152
LDI r2, 93
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
