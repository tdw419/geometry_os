; DESCRIPTION: Creates a magenta rectangular region at (90, 164) spanning 98 by 85 pixels.
; PLAN: r0=90(x), r1=164(y), r2=98(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 164
LDI r2, 98
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
