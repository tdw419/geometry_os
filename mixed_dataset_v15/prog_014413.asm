; DESCRIPTION: Draws a cyan circle centered at (108, 223) with radius 27.
; PLAN: r0=108(x), r1=223(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 223
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
