; DESCRIPTION: Creates a cyan rectangular region at (260, 65) spanning 14 by 32 pixels.
; PLAN: r0=260(x), r1=65(y), r2=14(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 65
LDI r2, 14
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
