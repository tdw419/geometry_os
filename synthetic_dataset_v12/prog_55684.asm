; DESCRIPTION: Renders a yellow box of size 89x54 starting at (305, 124).
; PLAN: r0=305(x), r1=124(y), r2=89(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 124
LDI r2, 89
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
