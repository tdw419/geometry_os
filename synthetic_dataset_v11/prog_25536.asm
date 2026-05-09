; DESCRIPTION: Creates a magenta rectangular region at (220, 60) spanning 20 by 82 pixels.
; PLAN: r0=220(x), r1=60(y), r2=20(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 60
LDI r2, 20
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
