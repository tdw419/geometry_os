; DESCRIPTION: Creates a cyan rectangular region at (75, 58) spanning 58 by 117 pixels.
; PLAN: r0=75(x), r1=58(y), r2=58(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 58
LDI r2, 58
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
