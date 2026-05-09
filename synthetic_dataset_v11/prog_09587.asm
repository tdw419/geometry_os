; DESCRIPTION: Creates a red rectangular region at (152, 133) spanning 91 by 37 pixels.
; PLAN: r0=152(x), r1=133(y), r2=91(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 133
LDI r2, 91
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
