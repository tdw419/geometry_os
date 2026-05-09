; DESCRIPTION: Creates a red rectangular region at (155, 129) spanning 93 by 47 pixels.
; PLAN: r0=155(x), r1=129(y), r2=93(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 129
LDI r2, 93
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
