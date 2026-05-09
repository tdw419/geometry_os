; DESCRIPTION: Renders a red box of size 84x120 starting at (382, 107).
; PLAN: r0=382(x), r1=107(y), r2=84(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 107
LDI r2, 84
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
