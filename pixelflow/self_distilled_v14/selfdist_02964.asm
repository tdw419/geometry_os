; DESCRIPTION: Renders a cyan rectangular region spanning 109 by 119 at (46, 2).
; PLAN: r0=46(x), r1=2(y), r2=109(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 2
LDI r2, 109
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
