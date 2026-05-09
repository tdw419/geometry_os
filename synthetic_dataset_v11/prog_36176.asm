; DESCRIPTION: Creates a red rectangular region at (103, 154) spanning 54 by 17 pixels.
; PLAN: r0=103(x), r1=154(y), r2=54(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 154
LDI r2, 54
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
