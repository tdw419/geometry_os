; DESCRIPTION: Creates a cyan rectangular region at (0, 58) spanning 37 by 27 pixels.
; PLAN: r0=0(x), r1=58(y), r2=37(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 58
LDI r2, 37
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
