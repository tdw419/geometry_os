; DESCRIPTION: Renders a red box of size 107x32 starting at (20, 149).
; PLAN: r0=20(x), r1=149(y), r2=107(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 149
LDI r2, 107
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
