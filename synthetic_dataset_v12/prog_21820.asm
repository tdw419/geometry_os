; DESCRIPTION: Creates a yellow rectangular region at (243, 189) spanning 91 by 55 pixels.
; PLAN: r0=243(x), r1=189(y), r2=91(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 189
LDI r2, 91
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
