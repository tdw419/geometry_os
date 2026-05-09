; DESCRIPTION: Renders a yellow box of size 111x50 starting at (39, 194).
; PLAN: r0=39(x), r1=194(y), r2=111(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 194
LDI r2, 111
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
