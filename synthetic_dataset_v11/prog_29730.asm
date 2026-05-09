; DESCRIPTION: Creates a yellow rectangular region at (42, 180) spanning 106 by 40 pixels.
; PLAN: r0=42(x), r1=180(y), r2=106(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 180
LDI r2, 106
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
