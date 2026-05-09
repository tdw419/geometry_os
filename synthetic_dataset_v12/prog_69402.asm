; DESCRIPTION: Creates a yellow rectangular region at (228, 125) spanning 34 by 109 pixels.
; PLAN: r0=228(x), r1=125(y), r2=34(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 125
LDI r2, 34
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
