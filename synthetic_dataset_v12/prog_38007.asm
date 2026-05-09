; DESCRIPTION: Creates a orange rectangular region at (117, 189) spanning 111 by 48 pixels.
; PLAN: r0=117(x), r1=189(y), r2=111(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 189
LDI r2, 111
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
