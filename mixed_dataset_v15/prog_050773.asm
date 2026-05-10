; DESCRIPTION: Creates a red rectangular region at (171, 117) spanning 20 by 93 pixels.
; PLAN: r0=171(x), r1=117(y), r2=20(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 117
LDI r2, 20
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
