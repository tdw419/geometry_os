; DESCRIPTION: Creates a cyan rectangular region at (340, 144) spanning 79 by 104 pixels.
; PLAN: r0=340(x), r1=144(y), r2=79(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 144
LDI r2, 79
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
