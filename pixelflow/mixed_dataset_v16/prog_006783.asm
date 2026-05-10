; DESCRIPTION: Renders a red rectangular region spanning 11 by 104 at (386, 180).
; PLAN: r0=386(x), r1=180(y), r2=11(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 180
LDI r2, 11
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
