; DESCRIPTION: Creates a cyan rectangular region at (435, 127) spanning 17 by 52 pixels.
; PLAN: r0=435(x), r1=127(y), r2=17(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 127
LDI r2, 17
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
