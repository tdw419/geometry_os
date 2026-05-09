; DESCRIPTION: Renders a red box of size 47x112 starting at (192, 128).
; PLAN: r0=192(x), r1=128(y), r2=47(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 128
LDI r2, 47
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
