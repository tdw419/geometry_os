; DESCRIPTION: Creates a green rectangular region at (298, 127) spanning 93 by 21 pixels.
; PLAN: r0=298(x), r1=127(y), r2=93(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 127
LDI r2, 93
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
