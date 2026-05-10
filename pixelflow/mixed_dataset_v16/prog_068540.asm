; DESCRIPTION: Creates a white rectangular region at (135, 152) spanning 69 by 77 pixels.
; PLAN: r0=135(x), r1=152(y), r2=69(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 152
LDI r2, 69
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
