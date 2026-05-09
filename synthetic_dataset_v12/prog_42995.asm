; DESCRIPTION: Renders a yellow box of size 94x82 starting at (94, 124).
; PLAN: r0=94(x), r1=124(y), r2=94(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 124
LDI r2, 94
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
