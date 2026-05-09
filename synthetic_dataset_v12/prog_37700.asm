; DESCRIPTION: Creates a cyan rectangular region at (52, 207) spanning 54 by 46 pixels.
; PLAN: r0=52(x), r1=207(y), r2=54(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 207
LDI r2, 54
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
