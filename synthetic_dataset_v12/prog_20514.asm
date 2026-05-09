; DESCRIPTION: Creates a cyan rectangular region at (237, 154) spanning 106 by 75 pixels.
; PLAN: r0=237(x), r1=154(y), r2=106(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 154
LDI r2, 106
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
