; DESCRIPTION: Renders a yellow box of size 39x57 starting at (180, 53).
; PLAN: r0=180(x), r1=53(y), r2=39(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 53
LDI r2, 39
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
