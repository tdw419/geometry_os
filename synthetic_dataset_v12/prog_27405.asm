; DESCRIPTION: Creates a red rectangular region at (50, 12) spanning 108 by 39 pixels.
; PLAN: r0=50(x), r1=12(y), r2=108(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 12
LDI r2, 108
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
