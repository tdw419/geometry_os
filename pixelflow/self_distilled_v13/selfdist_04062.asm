; DESCRIPTION: Renders a red rectangular region spanning 31 by 18 at (298, 47).
; PLAN: r0=298(x), r1=47(y), r2=31(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 47
LDI r2, 31
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
