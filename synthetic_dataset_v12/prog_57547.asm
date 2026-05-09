; DESCRIPTION: Creates a cyan rectangular region at (107, 154) spanning 11 by 89 pixels.
; PLAN: r0=107(x), r1=154(y), r2=11(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 154
LDI r2, 11
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
