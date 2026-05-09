; DESCRIPTION: Renders a red box of size 107x13 starting at (393, 196).
; PLAN: r0=393(x), r1=196(y), r2=107(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 196
LDI r2, 107
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
