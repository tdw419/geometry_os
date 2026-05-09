; DESCRIPTION: Creates a cyan rectangular region at (371, 37) spanning 54 by 25 pixels.
; PLAN: r0=371(x), r1=37(y), r2=54(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 37
LDI r2, 54
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
