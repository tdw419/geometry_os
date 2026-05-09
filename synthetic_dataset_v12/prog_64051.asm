; DESCRIPTION: Creates a cyan rectangular region at (186, 174) spanning 84 by 59 pixels.
; PLAN: r0=186(x), r1=174(y), r2=84(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 174
LDI r2, 84
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
