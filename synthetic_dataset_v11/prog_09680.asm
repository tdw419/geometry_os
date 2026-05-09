; DESCRIPTION: Creates a green rectangular region at (45, 138) spanning 109 by 65 pixels.
; PLAN: r0=45(x), r1=138(y), r2=109(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 138
LDI r2, 109
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
