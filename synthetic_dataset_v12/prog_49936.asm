; DESCRIPTION: Renders a red box of size 120x73 starting at (237, 107).
; PLAN: r0=237(x), r1=107(y), r2=120(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 107
LDI r2, 120
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
