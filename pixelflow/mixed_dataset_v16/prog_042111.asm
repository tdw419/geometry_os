; DESCRIPTION: Creates a red rectangular region at (148, 93) spanning 50 by 105 pixels.
; PLAN: r0=148(x), r1=93(y), r2=50(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 93
LDI r2, 50
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
