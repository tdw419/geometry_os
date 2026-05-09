; DESCRIPTION: Creates a blue rectangular region at (221, 93) spanning 27 by 40 pixels.
; PLAN: r0=221(x), r1=93(y), r2=27(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 93
LDI r2, 27
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
