; DESCRIPTION: Renders a white rectangular region spanning 45 by 45 at (398, 145).
; PLAN: r0=398(x), r1=145(y), r2=45(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 145
LDI r2, 45
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
