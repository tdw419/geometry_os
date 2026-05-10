; DESCRIPTION: Renders a cyan rectangular region spanning 32 by 71 at (9, 87).
; PLAN: r0=9(x), r1=87(y), r2=32(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 87
LDI r2, 32
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
