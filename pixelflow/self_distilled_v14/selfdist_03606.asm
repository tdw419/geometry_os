; DESCRIPTION: Renders a cyan rectangular region spanning 36 by 71 at (340, 41).
; PLAN: r0=340(x), r1=41(y), r2=36(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 41
LDI r2, 36
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
