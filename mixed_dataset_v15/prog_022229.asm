; DESCRIPTION: Creates a cyan rectangular region at (51, 16) spanning 24 by 18 pixels.
; PLAN: r0=51(x), r1=16(y), r2=24(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 16
LDI r2, 24
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
