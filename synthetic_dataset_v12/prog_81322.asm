; DESCRIPTION: Creates a cyan rectangular region at (242, 198) spanning 49 by 52 pixels.
; PLAN: r0=242(x), r1=198(y), r2=49(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 198
LDI r2, 49
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
