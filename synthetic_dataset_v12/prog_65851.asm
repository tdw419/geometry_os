; DESCRIPTION: Creates a cyan rectangular region at (104, 27) spanning 117 by 26 pixels.
; PLAN: r0=104(x), r1=27(y), r2=117(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 27
LDI r2, 117
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
