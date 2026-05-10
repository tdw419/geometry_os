; DESCRIPTION: Renders a cyan rectangular region spanning 23 by 25 at (192, 195).
; PLAN: r0=192(x), r1=195(y), r2=23(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 195
LDI r2, 23
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
