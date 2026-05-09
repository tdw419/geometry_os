; DESCRIPTION: Renders a red box of size 120x115 starting at (36, 18).
; PLAN: r0=36(x), r1=18(y), r2=120(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 18
LDI r2, 120
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
