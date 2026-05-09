; DESCRIPTION: Renders a magenta box of size 90x95 starting at (301, 94).
; PLAN: r0=301(x), r1=94(y), r2=90(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 94
LDI r2, 90
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
