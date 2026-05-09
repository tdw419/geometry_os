; DESCRIPTION: Creates a green rectangular region at (143, 82) spanning 74 by 60 pixels.
; PLAN: r0=143(x), r1=82(y), r2=74(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 82
LDI r2, 74
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
