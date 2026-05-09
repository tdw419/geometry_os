; DESCRIPTION: Creates a red rectangular region at (7, 163) spanning 21 by 93 pixels.
; PLAN: r0=7(x), r1=163(y), r2=21(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 163
LDI r2, 21
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
