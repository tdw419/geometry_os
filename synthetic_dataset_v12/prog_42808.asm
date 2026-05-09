; DESCRIPTION: Creates a green rectangular region at (386, 153) spanning 45 by 69 pixels.
; PLAN: r0=386(x), r1=153(y), r2=45(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 153
LDI r2, 45
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
