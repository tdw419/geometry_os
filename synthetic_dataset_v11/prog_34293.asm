; DESCRIPTION: Creates a cyan rectangular region at (151, 51) spanning 86 by 16 pixels.
; PLAN: r0=151(x), r1=51(y), r2=86(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 51
LDI r2, 86
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
