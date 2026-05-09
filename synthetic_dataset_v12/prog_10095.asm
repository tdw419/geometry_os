; DESCRIPTION: Creates a cyan rectangular region at (120, 68) spanning 104 by 81 pixels.
; PLAN: r0=120(x), r1=68(y), r2=104(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 68
LDI r2, 104
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
