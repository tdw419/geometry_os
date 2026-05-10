; DESCRIPTION: Creates a cyan rectangular region at (73, 230) spanning 48 by 22 pixels.
; PLAN: r0=73(x), r1=230(y), r2=48(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 230
LDI r2, 48
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
