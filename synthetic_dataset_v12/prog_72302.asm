; DESCRIPTION: Renders a red box of size 104x44 starting at (135, 104).
; PLAN: r0=135(x), r1=104(y), r2=104(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 104
LDI r2, 104
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
