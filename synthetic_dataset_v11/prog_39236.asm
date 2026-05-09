; DESCRIPTION: Composite: . Then Renders a yellow box of size 38x84 starting at (68, 104). Then Sets a single black pixel at (181, 182).
; PLAN: r0=68(x), r1=104(y), r2=38(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=181(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 38x84 starting at (68, 104).
; PLAN: r0=68(x), r1=104(y), r2=38(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 104
LDI r2, 38
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (181, 182).
; PLAN: r0=181(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
HALT
