; DESCRIPTION: Creates a magenta rectangular region at (213, 124) spanning 46 by 85 pixels.
; PLAN: r0=213(x), r1=124(y), r2=46(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 124
LDI r2, 46
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
