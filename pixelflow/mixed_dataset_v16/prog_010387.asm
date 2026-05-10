; DESCRIPTION: Creates a cyan rectangular region at (130, 60) spanning 87 by 51 pixels.
; PLAN: r0=130(x), r1=60(y), r2=87(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 60
LDI r2, 87
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
