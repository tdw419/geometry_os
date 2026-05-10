; DESCRIPTION: Creates a cyan rectangular region at (386, 165) spanning 63 by 47 pixels.
; PLAN: r0=386(x), r1=165(y), r2=63(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 165
LDI r2, 63
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
