; DESCRIPTION: Draws a cyan circle centered at (152, 124) with radius 71.
; PLAN: r0=152(x), r1=124(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 124
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
