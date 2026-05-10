; DESCRIPTION: Renders a cyan rectangular region spanning 120 by 41 at (209, 3).
; PLAN: r0=209(x), r1=3(y), r2=120(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 3
LDI r2, 120
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
