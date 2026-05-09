; DESCRIPTION: Creates a green rectangular region at (69, 65) spanning 82 by 86 pixels.
; PLAN: r0=69(x), r1=65(y), r2=82(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 65
LDI r2, 82
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
