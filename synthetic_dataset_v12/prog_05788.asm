; DESCRIPTION: Renders a red box of size 62x74 starting at (277, 182).
; PLAN: r0=277(x), r1=182(y), r2=62(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 182
LDI r2, 62
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
