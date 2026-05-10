; DESCRIPTION: Creates a red rectangular region at (410, 84) spanning 49 by 98 pixels.
; PLAN: r0=410(x), r1=84(y), r2=49(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 84
LDI r2, 49
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
