; DESCRIPTION: Creates a red rectangular region at (98, 30) spanning 93 by 77 pixels.
; PLAN: r0=98(x), r1=30(y), r2=93(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 30
LDI r2, 93
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
