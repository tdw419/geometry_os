; DESCRIPTION: Renders a red box of size 89x27 starting at (195, 28).
; PLAN: r0=195(x), r1=28(y), r2=89(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 28
LDI r2, 89
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
