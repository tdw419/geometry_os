; DESCRIPTION: Creates a purple rectangular region at (165, 152) spanning 46 by 10 pixels.
; PLAN: r0=165(x), r1=152(y), r2=46(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 152
LDI r2, 46
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
