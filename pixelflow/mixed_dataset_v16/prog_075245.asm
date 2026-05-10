; DESCRIPTION: Renders a white rectangular region spanning 41 by 76 at (298, 144).
; PLAN: r0=298(x), r1=144(y), r2=41(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 144
LDI r2, 41
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
