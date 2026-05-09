; DESCRIPTION: Creates a red rectangular region at (337, 69) spanning 120 by 97 pixels.
; PLAN: r0=337(x), r1=69(y), r2=120(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 69
LDI r2, 120
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
