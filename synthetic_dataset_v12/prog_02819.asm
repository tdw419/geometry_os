; DESCRIPTION: Renders a red box of size 94x69 starting at (24, 107).
; PLAN: r0=24(x), r1=107(y), r2=94(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 107
LDI r2, 94
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
