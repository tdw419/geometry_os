; DESCRIPTION: Creates a orange rectangular region at (328, 189) spanning 80 by 51 pixels.
; PLAN: r0=328(x), r1=189(y), r2=80(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 189
LDI r2, 80
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
