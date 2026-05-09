; DESCRIPTION: Draws a cyan circle centered at (281, 67) with radius 57.
; PLAN: r0=281(x), r1=67(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 67
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
