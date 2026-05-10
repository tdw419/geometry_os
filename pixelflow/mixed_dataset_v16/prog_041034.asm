; DESCRIPTION: Renders a cyan rectangular region spanning 102 by 61 at (366, 159).
; PLAN: r0=366(x), r1=159(y), r2=102(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 159
LDI r2, 102
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
