; DESCRIPTION: Creates a purple rectangular region at (392, 154) spanning 65 by 93 pixels.
; PLAN: r0=392(x), r1=154(y), r2=65(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 154
LDI r2, 65
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
