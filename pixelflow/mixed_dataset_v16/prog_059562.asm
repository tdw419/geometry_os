; DESCRIPTION: Renders a red box of size 115x46 starting at (70, 187).
; PLAN: r0=70(x), r1=187(y), r2=115(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 187
LDI r2, 115
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
