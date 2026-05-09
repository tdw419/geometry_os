; DESCRIPTION: Creates a red rectangular region at (294, 81) spanning 100 by 65 pixels.
; PLAN: r0=294(x), r1=81(y), r2=100(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 81
LDI r2, 100
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
