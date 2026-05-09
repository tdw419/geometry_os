; DESCRIPTION: Creates a red rectangular region at (436, 106) spanning 45 by 93 pixels.
; PLAN: r0=436(x), r1=106(y), r2=45(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 106
LDI r2, 45
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
