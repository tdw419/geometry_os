; DESCRIPTION: Creates a cyan rectangular region at (229, 114) spanning 64 by 65 pixels.
; PLAN: r0=229(x), r1=114(y), r2=64(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 114
LDI r2, 64
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
