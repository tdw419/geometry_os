; DESCRIPTION: Creates a yellow rectangular region at (152, 60) spanning 82 by 120 pixels.
; PLAN: r0=152(x), r1=60(y), r2=82(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 60
LDI r2, 82
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
