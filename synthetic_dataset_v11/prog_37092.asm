; DESCRIPTION: Creates a magenta rectangular region at (197, 152) spanning 31 by 19 pixels.
; PLAN: r0=197(x), r1=152(y), r2=31(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 152
LDI r2, 31
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
