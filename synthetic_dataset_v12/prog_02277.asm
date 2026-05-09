; DESCRIPTION: Renders a yellow box of size 24x50 starting at (410, 49).
; PLAN: r0=410(x), r1=49(y), r2=24(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 49
LDI r2, 24
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
