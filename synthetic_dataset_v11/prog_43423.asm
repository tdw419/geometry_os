; DESCRIPTION: Creates a cyan rectangular region at (58, 111) spanning 89 by 36 pixels.
; PLAN: r0=58(x), r1=111(y), r2=89(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 111
LDI r2, 89
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
