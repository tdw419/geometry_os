; DESCRIPTION: Creates a cyan rectangular region at (414, 124) spanning 58 by 81 pixels.
; PLAN: r0=414(x), r1=124(y), r2=58(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 124
LDI r2, 58
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
