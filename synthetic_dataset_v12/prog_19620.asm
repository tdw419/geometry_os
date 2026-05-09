; DESCRIPTION: Renders a red box of size 111x45 starting at (361, 55).
; PLAN: r0=361(x), r1=55(y), r2=111(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 55
LDI r2, 111
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
