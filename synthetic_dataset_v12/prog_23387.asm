; DESCRIPTION: Creates a red rectangular region at (264, 189) spanning 112 by 13 pixels.
; PLAN: r0=264(x), r1=189(y), r2=112(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 189
LDI r2, 112
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
