; DESCRIPTION: Creates a red rectangular region at (94, 93) spanning 12 by 21 pixels.
; PLAN: r0=94(x), r1=93(y), r2=12(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 93
LDI r2, 12
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
