; DESCRIPTION: Creates a red rectangular region at (250, 73) spanning 95 by 98 pixels.
; PLAN: r0=250(x), r1=73(y), r2=95(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 73
LDI r2, 95
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
