; DESCRIPTION: Creates a cyan rectangular region at (206, 44) spanning 115 by 61 pixels.
; PLAN: r0=206(x), r1=44(y), r2=115(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 44
LDI r2, 115
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
