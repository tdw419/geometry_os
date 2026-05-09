; DESCRIPTION: Creates a cyan rectangular region at (178, 160) spanning 51 by 95 pixels.
; PLAN: r0=178(x), r1=160(y), r2=51(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 160
LDI r2, 51
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
