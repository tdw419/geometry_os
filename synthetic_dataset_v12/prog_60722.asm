; DESCRIPTION: Creates a cyan rectangular region at (333, 7) spanning 81 by 40 pixels.
; PLAN: r0=333(x), r1=7(y), r2=81(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 7
LDI r2, 81
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
