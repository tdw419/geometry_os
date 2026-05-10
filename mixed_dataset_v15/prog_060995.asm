; DESCRIPTION: Creates a red rectangular region at (403, 104) spanning 93 by 27 pixels.
; PLAN: r0=403(x), r1=104(y), r2=93(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 104
LDI r2, 93
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
