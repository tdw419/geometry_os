; DESCRIPTION: Creates a green rectangular region at (69, 164) spanning 93 by 91 pixels.
; PLAN: r0=69(x), r1=164(y), r2=93(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 164
LDI r2, 93
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
