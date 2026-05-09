; DESCRIPTION: Creates a green rectangular region at (262, 139) spanning 95 by 82 pixels.
; PLAN: r0=262(x), r1=139(y), r2=95(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 139
LDI r2, 95
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
