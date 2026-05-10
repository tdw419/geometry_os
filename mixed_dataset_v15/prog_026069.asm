; DESCRIPTION: Creates a red rectangular region at (226, 70) spanning 91 by 68 pixels.
; PLAN: r0=226(x), r1=70(y), r2=91(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 70
LDI r2, 91
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
