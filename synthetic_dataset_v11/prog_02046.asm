; DESCRIPTION: Creates a magenta rectangular region at (71, 129) spanning 69 by 59 pixels.
; PLAN: r0=71(x), r1=129(y), r2=69(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 129
LDI r2, 69
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
