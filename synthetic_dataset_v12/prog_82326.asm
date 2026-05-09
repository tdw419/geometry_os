; DESCRIPTION: Creates a red rectangular region at (294, 48) spanning 24 by 117 pixels.
; PLAN: r0=294(x), r1=48(y), r2=24(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 48
LDI r2, 24
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
