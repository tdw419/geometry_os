; DESCRIPTION: Renders a red box of size 20x39 starting at (417, 200).
; PLAN: r0=417(x), r1=200(y), r2=20(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 200
LDI r2, 20
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
