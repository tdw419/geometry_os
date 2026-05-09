; DESCRIPTION: Creates a orange rectangular region at (392, 33) spanning 71 by 17 pixels.
; PLAN: r0=392(x), r1=33(y), r2=71(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 33
LDI r2, 71
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
