; DESCRIPTION: Creates a magenta rectangular region at (69, 142) spanning 72 by 104 pixels.
; PLAN: r0=69(x), r1=142(y), r2=72(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 142
LDI r2, 72
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
