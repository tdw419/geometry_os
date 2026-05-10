; DESCRIPTION: Renders a cyan rectangular region spanning 87 by 98 at (28, 1).
; PLAN: r0=28(x), r1=1(y), r2=87(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 1
LDI r2, 87
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
