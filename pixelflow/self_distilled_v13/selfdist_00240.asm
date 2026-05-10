; DESCRIPTION: Renders a red rectangular region spanning 72 by 28 at (398, 152).
; PLAN: r0=398(x), r1=152(y), r2=72(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 152
LDI r2, 72
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
