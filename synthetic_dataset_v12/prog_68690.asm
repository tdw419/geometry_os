; DESCRIPTION: Creates a magenta rectangular region at (298, 68) spanning 109 by 100 pixels.
; PLAN: r0=298(x), r1=68(y), r2=109(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 68
LDI r2, 109
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
