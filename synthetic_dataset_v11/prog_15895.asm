; DESCRIPTION: Creates a magenta rectangular region at (82, 7) spanning 98 by 80 pixels.
; PLAN: r0=82(x), r1=7(y), r2=98(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 7
LDI r2, 98
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
