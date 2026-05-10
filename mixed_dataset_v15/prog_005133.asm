; DESCRIPTION: Creates a red rectangular region at (202, 40) spanning 30 by 108 pixels.
; PLAN: r0=202(x), r1=40(y), r2=30(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 40
LDI r2, 30
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
