; DESCRIPTION: Draws a cyan circle centered at (352, 230) with radius 14.
; PLAN: r0=352(x), r1=230(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 230
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
