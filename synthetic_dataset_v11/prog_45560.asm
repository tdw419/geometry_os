; DESCRIPTION: Creates a cyan rectangular region at (79, 81) spanning 117 by 39 pixels.
; PLAN: r0=79(x), r1=81(y), r2=117(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 81
LDI r2, 117
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
