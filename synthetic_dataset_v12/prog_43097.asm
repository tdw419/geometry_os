; DESCRIPTION: Creates a green rectangular region at (295, 168) spanning 102 by 69 pixels.
; PLAN: r0=295(x), r1=168(y), r2=102(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 168
LDI r2, 102
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
