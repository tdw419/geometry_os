; DESCRIPTION: Renders a green box of size 96x24 starting at (182, 171).
; PLAN: r0=182(x), r1=171(y), r2=96(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 171
LDI r2, 96
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
