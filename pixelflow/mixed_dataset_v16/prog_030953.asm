; DESCRIPTION: Renders a red box of size 98x22 starting at (177, 115).
; PLAN: r0=177(x), r1=115(y), r2=98(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 115
LDI r2, 98
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
