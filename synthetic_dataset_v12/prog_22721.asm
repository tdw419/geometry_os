; DESCRIPTION: Renders a red box of size 107x26 starting at (366, 200).
; PLAN: r0=366(x), r1=200(y), r2=107(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 200
LDI r2, 107
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
