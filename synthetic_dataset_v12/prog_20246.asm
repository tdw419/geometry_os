; DESCRIPTION: Draws a cyan circle centered at (113, 146) with radius 67.
; PLAN: r0=113(x), r1=146(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 146
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
