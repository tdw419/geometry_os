; DESCRIPTION: Renders a red box of size 50x100 starting at (323, 108).
; PLAN: r0=323(x), r1=108(y), r2=50(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 108
LDI r2, 50
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
