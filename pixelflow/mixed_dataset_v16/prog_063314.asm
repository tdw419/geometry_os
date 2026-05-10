; DESCRIPTION: Renders a cyan rectangular region spanning 48 by 95 at (325, 43).
; PLAN: r0=325(x), r1=43(y), r2=48(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 43
LDI r2, 48
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
