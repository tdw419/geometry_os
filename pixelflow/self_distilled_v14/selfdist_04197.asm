; DESCRIPTION: Renders a purple rectangular region spanning 45 by 104 at (295, 135).
; PLAN: r0=295(x), r1=135(y), r2=45(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 135
LDI r2, 45
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
