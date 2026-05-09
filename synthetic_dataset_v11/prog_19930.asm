; DESCRIPTION: Creates a cyan rectangular region at (128, 51) spanning 73 by 16 pixels.
; PLAN: r0=128(x), r1=51(y), r2=73(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 51
LDI r2, 73
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
