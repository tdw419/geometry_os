; DESCRIPTION: Creates a cyan rectangular region at (39, 146) spanning 67 by 104 pixels.
; PLAN: r0=39(x), r1=146(y), r2=67(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 146
LDI r2, 67
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
