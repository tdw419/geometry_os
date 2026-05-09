; DESCRIPTION: Renders a red box of size 31x48 starting at (270, 150).
; PLAN: r0=270(x), r1=150(y), r2=31(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 150
LDI r2, 31
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
