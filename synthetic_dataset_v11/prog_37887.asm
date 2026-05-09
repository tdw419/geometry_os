; DESCRIPTION: Creates a green rectangular region at (33, 195) spanning 109 by 55 pixels.
; PLAN: r0=33(x), r1=195(y), r2=109(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 195
LDI r2, 109
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
