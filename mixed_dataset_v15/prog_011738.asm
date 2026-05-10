; DESCRIPTION: Renders a red box of size 48x56 starting at (190, 150).
; PLAN: r0=190(x), r1=150(y), r2=48(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 150
LDI r2, 48
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
