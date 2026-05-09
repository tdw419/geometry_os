; DESCRIPTION: Renders a red box of size 15x33 starting at (419, 221).
; PLAN: r0=419(x), r1=221(y), r2=15(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 221
LDI r2, 15
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
