; DESCRIPTION: Creates a cyan rectangular region at (198, 99) spanning 80 by 18 pixels.
; PLAN: r0=198(x), r1=99(y), r2=80(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 99
LDI r2, 80
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
