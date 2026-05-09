; DESCRIPTION: Creates a cyan rectangular region at (300, 51) spanning 86 by 51 pixels.
; PLAN: r0=300(x), r1=51(y), r2=86(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 51
LDI r2, 86
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
