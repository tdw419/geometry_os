; DESCRIPTION: Creates a cyan rectangular region at (57, 98) spanning 36 by 112 pixels.
; PLAN: r0=57(x), r1=98(y), r2=36(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 98
LDI r2, 36
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
