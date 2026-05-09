; DESCRIPTION: Creates a cyan rectangular region at (198, 66) spanning 52 by 98 pixels.
; PLAN: r0=198(x), r1=66(y), r2=52(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 66
LDI r2, 52
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
