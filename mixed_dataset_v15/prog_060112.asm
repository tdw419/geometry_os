; DESCRIPTION: Creates a red rectangular region at (301, 194) spanning 113 by 23 pixels.
; PLAN: r0=301(x), r1=194(y), r2=113(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 194
LDI r2, 113
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
