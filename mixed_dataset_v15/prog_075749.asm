; DESCRIPTION: Renders a cyan rectangular region spanning 64 by 17 at (162, 39).
; PLAN: r0=162(x), r1=39(y), r2=64(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 39
LDI r2, 64
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
