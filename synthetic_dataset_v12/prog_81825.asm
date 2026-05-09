; DESCRIPTION: Creates a magenta rectangular region at (290, 152) spanning 47 by 64 pixels.
; PLAN: r0=290(x), r1=152(y), r2=47(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 152
LDI r2, 47
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
