; DESCRIPTION: Creates a cyan rectangular region at (60, 127) spanning 104 by 63 pixels.
; PLAN: r0=60(x), r1=127(y), r2=104(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 127
LDI r2, 104
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
