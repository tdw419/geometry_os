; DESCRIPTION: Creates a blue rectangular region at (452, 186) spanning 56 by 27 pixels.
; PLAN: r0=452(x), r1=186(y), r2=56(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 186
LDI r2, 56
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
