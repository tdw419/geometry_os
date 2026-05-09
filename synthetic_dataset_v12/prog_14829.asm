; DESCRIPTION: Renders a red box of size 32x52 starting at (448, 166).
; PLAN: r0=448(x), r1=166(y), r2=32(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 166
LDI r2, 32
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
