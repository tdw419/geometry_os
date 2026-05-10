; DESCRIPTION: Renders a orange rectangular region spanning 108 by 116 at (210, 20).
; PLAN: r0=210(x), r1=20(y), r2=108(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 20
LDI r2, 108
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
