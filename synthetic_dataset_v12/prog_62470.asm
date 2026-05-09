; DESCRIPTION: Creates a cyan rectangular region at (64, 73) spanning 96 by 75 pixels.
; PLAN: r0=64(x), r1=73(y), r2=96(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 73
LDI r2, 96
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
