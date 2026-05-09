; DESCRIPTION: Creates a cyan rectangular region at (295, 67) spanning 25 by 94 pixels.
; PLAN: r0=295(x), r1=67(y), r2=25(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 67
LDI r2, 25
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
