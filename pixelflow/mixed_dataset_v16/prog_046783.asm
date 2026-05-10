; DESCRIPTION: Renders a red rectangular region spanning 22 by 70 at (273, 152).
; PLAN: r0=273(x), r1=152(y), r2=22(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 152
LDI r2, 22
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
