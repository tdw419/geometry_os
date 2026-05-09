; DESCRIPTION: Draws a cyan circle centered at (445, 113) with radius 64.
; PLAN: r0=445(x), r1=113(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 113
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
