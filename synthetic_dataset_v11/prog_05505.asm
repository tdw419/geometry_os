; DESCRIPTION: Creates a cyan rectangular region at (91, 94) spanning 117 by 96 pixels.
; PLAN: r0=91(x), r1=94(y), r2=117(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 94
LDI r2, 117
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
