; DESCRIPTION: Renders a magenta rectangular region spanning 22 by 77 at (76, 91).
; PLAN: r0=76(x), r1=91(y), r2=22(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 91
LDI r2, 22
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
