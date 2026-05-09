; DESCRIPTION: Creates a magenta rectangular region at (202, 146) spanning 19 by 70 pixels.
; PLAN: r0=202(x), r1=146(y), r2=19(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 146
LDI r2, 19
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
