; DESCRIPTION: Renders a magenta box of size 96x72 starting at (410, 119).
; PLAN: r0=410(x), r1=119(y), r2=96(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 119
LDI r2, 96
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
