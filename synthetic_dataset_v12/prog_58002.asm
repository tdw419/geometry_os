; DESCRIPTION: Renders a red box of size 104x102 starting at (120, 152).
; PLAN: r0=120(x), r1=152(y), r2=104(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 152
LDI r2, 104
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
