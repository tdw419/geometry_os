; DESCRIPTION: Renders a purple box of size 65x92 starting at (434, 95).
; PLAN: r0=434(x), r1=95(y), r2=65(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 95
LDI r2, 65
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
