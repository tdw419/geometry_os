; DESCRIPTION: Renders a red box of size 31x90 starting at (434, 36).
; PLAN: r0=434(x), r1=36(y), r2=31(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 36
LDI r2, 31
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
