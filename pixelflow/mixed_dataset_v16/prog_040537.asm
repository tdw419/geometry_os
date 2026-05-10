; DESCRIPTION: Creates a cyan rectangular region at (57, 168) spanning 45 by 24 pixels.
; PLAN: r0=57(x), r1=168(y), r2=45(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 168
LDI r2, 45
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
