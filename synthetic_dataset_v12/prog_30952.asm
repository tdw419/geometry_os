; DESCRIPTION: Creates a red rectangular region at (94, 134) spanning 48 by 111 pixels.
; PLAN: r0=94(x), r1=134(y), r2=48(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 134
LDI r2, 48
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
