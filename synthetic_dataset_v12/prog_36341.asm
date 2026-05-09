; DESCRIPTION: Creates a magenta rectangular region at (55, 129) spanning 28 by 100 pixels.
; PLAN: r0=55(x), r1=129(y), r2=28(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 129
LDI r2, 28
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
