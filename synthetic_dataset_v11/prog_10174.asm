; DESCRIPTION: Creates a red rectangular region at (26, 0) spanning 120 by 98 pixels.
; PLAN: r0=26(x), r1=0(y), r2=120(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 0
LDI r2, 120
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
