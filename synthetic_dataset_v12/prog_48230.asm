; DESCRIPTION: Creates a cyan rectangular region at (198, 159) spanning 37 by 44 pixels.
; PLAN: r0=198(x), r1=159(y), r2=37(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 159
LDI r2, 37
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
