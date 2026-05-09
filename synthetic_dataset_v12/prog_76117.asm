; DESCRIPTION: Renders a red box of size 101x115 starting at (187, 35).
; PLAN: r0=187(x), r1=35(y), r2=101(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 35
LDI r2, 101
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
