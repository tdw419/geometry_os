; DESCRIPTION: Draws a cyan circle centered at (445, 205) with radius 16.
; PLAN: r0=445(x), r1=205(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 205
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
