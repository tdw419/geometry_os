; DESCRIPTION: Creates a cyan rectangular region at (296, 171) spanning 104 by 35 pixels.
; PLAN: r0=296(x), r1=171(y), r2=104(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 171
LDI r2, 104
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
