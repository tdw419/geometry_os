; DESCRIPTION: Creates a green rectangular region at (45, 205) spanning 82 by 12 pixels.
; PLAN: r0=45(x), r1=205(y), r2=82(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 205
LDI r2, 82
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
