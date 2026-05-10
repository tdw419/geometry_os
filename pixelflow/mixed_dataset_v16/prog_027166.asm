; DESCRIPTION: Creates a cyan rectangular region at (103, 11) spanning 109 by 65 pixels.
; PLAN: r0=103(x), r1=11(y), r2=109(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 11
LDI r2, 109
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
