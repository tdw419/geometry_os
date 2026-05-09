; DESCRIPTION: Creates a red rectangular region at (265, 159) spanning 33 by 58 pixels.
; PLAN: r0=265(x), r1=159(y), r2=33(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 159
LDI r2, 33
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
