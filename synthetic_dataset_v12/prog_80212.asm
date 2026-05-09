; DESCRIPTION: Creates a cyan rectangular region at (196, 58) spanning 19 by 66 pixels.
; PLAN: r0=196(x), r1=58(y), r2=19(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 58
LDI r2, 19
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
