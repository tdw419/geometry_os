; DESCRIPTION: Creates a cyan rectangular region at (64, 195) spanning 53 by 51 pixels.
; PLAN: r0=64(x), r1=195(y), r2=53(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 195
LDI r2, 53
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
