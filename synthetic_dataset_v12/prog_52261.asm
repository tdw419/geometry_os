; DESCRIPTION: Renders a red box of size 90x51 starting at (198, 75).
; PLAN: r0=198(x), r1=75(y), r2=90(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 75
LDI r2, 90
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
