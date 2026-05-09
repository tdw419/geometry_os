; DESCRIPTION: Creates a white rectangular region at (154, 125) spanning 68 by 116 pixels.
; PLAN: r0=154(x), r1=125(y), r2=68(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 125
LDI r2, 68
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
