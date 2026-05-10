; DESCRIPTION: Renders a cyan rectangular region spanning 35 by 14 at (338, 5).
; PLAN: r0=338(x), r1=5(y), r2=35(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 5
LDI r2, 35
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
