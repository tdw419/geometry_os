; DESCRIPTION: Creates a red rectangular region at (120, 4) spanning 115 by 113 pixels.
; PLAN: r0=120(x), r1=4(y), r2=115(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 4
LDI r2, 115
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
