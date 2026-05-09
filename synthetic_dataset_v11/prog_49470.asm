; DESCRIPTION: Creates a red rectangular region at (82, 80) spanning 87 by 24 pixels.
; PLAN: r0=82(x), r1=80(y), r2=87(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 80
LDI r2, 87
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
