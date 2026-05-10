; DESCRIPTION: Renders a cyan rectangular region spanning 115 by 35 at (293, 73).
; PLAN: r0=293(x), r1=73(y), r2=115(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 73
LDI r2, 115
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
