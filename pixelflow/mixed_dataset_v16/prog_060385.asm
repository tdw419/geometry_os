; DESCRIPTION: Creates a white rectangular region at (450, 154) spanning 38 by 65 pixels.
; PLAN: r0=450(x), r1=154(y), r2=38(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 154
LDI r2, 38
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
