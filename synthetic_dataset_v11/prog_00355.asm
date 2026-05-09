; DESCRIPTION: Renders a yellow box of size 94x39 starting at (1, 186).
; PLAN: r0=1(x), r1=186(y), r2=94(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 186
LDI r2, 94
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
