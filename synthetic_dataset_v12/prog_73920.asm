; DESCRIPTION: Creates a cyan rectangular region at (464, 71) spanning 12 by 47 pixels.
; PLAN: r0=464(x), r1=71(y), r2=12(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 71
LDI r2, 12
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
