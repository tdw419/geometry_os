; DESCRIPTION: Renders a orange rectangular region spanning 108 by 60 at (255, 152).
; PLAN: r0=255(x), r1=152(y), r2=108(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 152
LDI r2, 108
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
