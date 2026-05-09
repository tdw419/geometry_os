; DESCRIPTION: Creates a yellow rectangular region at (392, 73) spanning 68 by 37 pixels.
; PLAN: r0=392(x), r1=73(y), r2=68(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 73
LDI r2, 68
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
