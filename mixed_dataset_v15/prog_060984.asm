; DESCRIPTION: Creates a red rectangular region at (16, 74) spanning 39 by 97 pixels.
; PLAN: r0=16(x), r1=74(y), r2=39(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 74
LDI r2, 39
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
