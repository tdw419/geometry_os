; DESCRIPTION: Renders a yellow box of size 38x105 starting at (146, 39).
; PLAN: r0=146(x), r1=39(y), r2=38(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 39
LDI r2, 38
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
