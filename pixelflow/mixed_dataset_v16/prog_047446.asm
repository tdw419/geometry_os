; DESCRIPTION: Creates a yellow rectangular region at (220, 29) spanning 113 by 65 pixels.
; PLAN: r0=220(x), r1=29(y), r2=113(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 29
LDI r2, 113
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
