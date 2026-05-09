; DESCRIPTION: Creates a red rectangular region at (406, 150) spanning 33 by 53 pixels.
; PLAN: r0=406(x), r1=150(y), r2=33(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 150
LDI r2, 33
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
