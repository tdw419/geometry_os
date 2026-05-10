; DESCRIPTION: Renders a cyan rectangular region spanning 95 by 46 at (169, 158).
; PLAN: r0=169(x), r1=158(y), r2=95(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 158
LDI r2, 95
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
